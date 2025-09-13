const express = require('express');
const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();
const router = express.Router();

//get all residents
router.get('/', async (req, res) => {
    try {
        const residents = await prisma.resident.findMany();
        res.json(residents);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch residents' });
    }
});

//get a resident by ID
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const resident = await prisma.resident.findUnique({
            where: { id: parseInt(id) },
        });
        if (resident) {
            res.json(resident);
        } else {
            res.status(404).json({ error: 'Resident not found' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch resident' });
    }
});

//add a new resident
router.post('/add', async (req, res) => {
    const { name, gnumber, building, roomNumber } = req.body;
    try {
        const newResident = await prisma.resident.create({
            data: { name, gnumber, building, roomNumber },
        });
        res.status(201).json(newResident);
    } catch (error) {
        res.status(500).json({ error: 'Failed to add resident' });
    }
}   );

module.exports = router; 


