# Step 1: Use the official Node.js image as the base image
FROM node:16

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Step 4: Install the application dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the container
COPY . .

# Step 6: Expose port 3000
EXPOSE 3000

# Step 7: Define the command to run the application
CMD ["npm", "start"]
