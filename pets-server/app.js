
const express = require('express')
const app = express() 

// localhost:3000
app.get('/pet-listing', (req, res) => {
   //res.json({message: 'Hello World'})

   const model = {
        pageTitle : "Pets",
        components: [
            {
                type: "featuredImage",
                data:{
                    imageUrl: "https://as2.ftcdn.net/v2/jpg/01/99/00/79/1000_F_199007925_NolyRdRrdYqUAGdVZV38P4WX8pYfBaRP.jpg"
                }
            }
        ]
   }
   res.json(model)
})

app.listen(3000, () => {
    console.log('Server is running...')
})