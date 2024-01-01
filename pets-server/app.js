
const express = require('express')
const app = express() 

// localhost:3000
app.get('/pet-listing', (req, res) => {
   //res.json({message: 'Hello World'})

   const model = {
        pageTitle : "Pets",
        components: [
            {
                type: "featuredPets",
                data:{
                    imageUrl: "https://www.google.com"
                }
            }
        ]
   }
   res.json(model)
})

app.listen(3000, () => {
    console.log('Server is running...')
})