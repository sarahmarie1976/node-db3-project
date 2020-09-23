const db = require('../data/db-config.js');

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({id}).first();
}

function findSteps(id) {
    return db('steps as s')
    .join('schemes as sc',
            'sc.id', 's.id')
    .select('s.id', 
            'sc.scheme_name', 's.instructions')
    .where({ scheme_id: id });
}

function add(scheme) {
    return db('schemes')
    .insert(scheme, 'id');
}

const update = async (changes, id) => {
	const res = await db('schemes').where({ id }).update(changes);
	return findById(id);
};


function remove(id) {
    return db('schemes')
    .where({ id })
    .del();
}

// const addStep = async (step, scheme_id) => {
// 	const id = await db('steps').insert({ ...step, scheme_id });
// 	return await db('steps').where({ id }).first();
// };


module.exports = {
    find, 
    findById,
    findSteps, 
    add, 
    update, 
    remove,
    // addStep 
}