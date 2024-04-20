# jobscan_flutter

Adv Mobile Application Development

Group 5

Application Name: JOBSCAN

Course Code: PROG8700-24W-Sec7-Advanced Mobile Application Development Professor Name: Nicolas Blier

Group Members: 

Nandipati Vamsi - 8922647

Justin Janson – 8868914

Sandeep Kaur – 8899764

Nibin Moideenkutty – 8890966

Github link: https://github.com/NibinByteCode/jobscan_flutter.git

Video Demo link: https://youtu.be/7ZcMc1_Oq4A


                Adv Mobile Application Development
                                                          Group 5
Application Name: JOBSCAN_Flutter
Course Code: PROG8700-24W-Sec7-Advanced Mobile Application Development
Professor Name: Nicolas Blier
Group Members:
Nandipati Vamsi - 8922647
Justin Janson – 8868914
Sandeep Kaur – 8899764
Nibin Moideenkutty – 8890966

Github link: https://github.com/NibinByteCode/jobscan_flutter

JobScan is a Job Recruiting Application. It is used by Recruiters and job seeking Candidates. It has mainly Three Navigation Pages –
1.	Home Screen (Display General Posts)
2.	Jobs Screen (Displays Job Posts)
3.	Post Creation Screen 
4.	Candidate Screen
5.	Profile Screen.
Every Page has some unique functionalities that make this application effective and user-friendly. All the functionalities and main features of each page or activity in this application are written below: -
1. SplashScreen: - This Activity contains the splash screen with the attractive logo of the application.
2. Login and SignUp Screen: - After the splash screen, the user will be landed on the login page. This page has two fields- UserEmail and Password. If the user is already registered, then he can log in to the home page. Otherwise, he must go to the signup page to register himself. The main feature of the signup page is that all fields have validation, and the user cannot sign up before filling all the fields with the correct data format. 
3. Home Screen: - This is the application's home page which is opened after user login. This page displays all the general posts of the users. It will display posts of the connected users only.
4. Jobs Screen: - This page displays all the jobs posted and visible to all users. When users clicks on a particular job it navigates to Job details page with Hero animation.
5. Job Details Screen: Displays all the information about the job and provides Apply now button. When users clicks on Apply now, the job is saved in his profile and users is automatically navigated back to job screen.
6. Post Creation screen : In this page user can create both posts and jobs based on the radio button selection. By default it loads with posts where you have input field to add post content and submit which will take to home page. If user is clicking on Jobs button then extra fields will be enabled to take job title, job salary, job description and submit button.

7. Candidate Screen: - Candidate screen has ListView that displays all candidates who registered with this application. Each candidate data displays through a card view which contains username, designation, and user profile image. Users can click on any card in the connections to view more details about them. This page's special feature is the case sensitive search functionality, which allows users to search for candidates/recruiters.
8.Candidate Detail Screen: - When a user clicks on any of the cards in Candidate screen, then the user will be navigated to the candidate detail screen, which displays all details of the selected candidate such as candidate name, type, connections count, designation, company, email, phone number, qualifications, and date of birth. The main functionality on this page is the connect button, which allows the logged-in user to connect with fellow candidates/recruiters. When the user clicks on the connect button, the ID of the selected candidate/recruiter is added to the connections list of the user, and the logged-in user ID is added to the selected candidate/recruiter connections list (i.e., it becomes a two-way connection). At the same time, the connections count of both the logged-in as well as selected candidate/recruiter will be incremented by 1. All these operations are dynamically recorded in the Realtime database.
9.Profile Screen: - It displays the profile of current logged-in user with all the details and user image. The special functionality of this page is the logout button which entices the user back to the login page.

Extra Features: 
•	This application also has some extra features such as bottom navigation bar that makes it user-friendly. Users can easily go to any application page with this navigation feature. This nav bar has five icons for navigating to Home, Jobs, Create, Connections, and Profile page. Another feature is in the candidate page search bar. 
•	On the home page, the users have ability to view the profile of the other user who has posted the post.
•	In this application, instead of using hardcoded values we used Firebase for fetch the data. we used the Firebase Realtime database and Cloud Firestore for store the data and images.

