# Peak Performance Personal Training
## 1. Business Description and User Roles

**Business Name:** Peak Performance Personal Training

**Business Description:**

Peak Performance Personal Training is a fitness business that provides one-on-one personal training sessions and training packages. The business helps clients schedule training sessions, explore available packages, and manage their appointments. The goal of the AI assistant is to make it easier for clients to find information and request changes without needing to contact a trainer directly for every question.

**Customer Chat:**

The customer-facing AI assistant helps clients check their upcoming appointments, learn about available training packages, and ask general questions about the business. Clients can also request appointment changes, but the assistant cannot directly modify confirmed appointments.

**Staff Tab:**

The Staff tab is only for authorized employees and trainers. Staff members can review appointment change requests submitted through the AI assistant and decide whether to approve or reject them. Approved requests are then applied to the appointment records.

Table 1: training_packages

Stores available training packages, their prices, and the number of sessions included.

package_id · package_name · sessions_included · price

Table 2: appointments

Stores client appointments, scheduled dates, trainers, and appointment status.

appointment_id · client_name · trainer_name · session_date · status

Table 3: change_requests

Stores appointment changes that need staff approval.

request_id · appointment_id · requested_date · status

## 2. Database Design

My personal training business will use a SQLite database with three tables.

The **training_packages** table will store information about the personal training packages offered by the business, including package names, prices, and the number of sessions included.

The **appointments** table will store scheduled personal training sessions, including the client's name, assigned trainer, appointment date, and current status.

The **change_requests** table will record requests from clients who want to reschedule their appointments. These requests will remain pending until an authorized staff member approves or rejects them. The AI assistant will not be allowed to change appointments directly.

The training_packages and appointments tables will each contain at least five sample records. The change_requests table will initially be empty.

**Table 3: change_requests**

The change_requests table will store requests from clients who want to reschedule their personal training appointments. Each request will include an appointment ID, the requested new date, and an approval status. All requests will start as waiting and must be approved or rejected by staff before any appointment is changed.

Tool 1: lookup_appointment

Allows a client to check an existing training appointment using an appointment ID.

Tool 2: lookup_training_package

Allows a customer to view information about a training package, including its price and number of sessions.

## 3. Lookup Tools and Argument Validation

My AI assistant will have two lookup tools that allow customers to retrieve information from the database without changing any records.

**Tool 1: lookup_appointment**

This tool allows customers to check their existing personal training appointments. The customer provides an appointment ID, and the tool retrieves the appointment date, assigned trainer, and appointment status.

Before searching the database, the tool will check that the appointment ID is provided and follows the correct format. It will also verify that the customer is authorized to view that appointment. If the ID is invalid or the customer does not have permission, the tool will not return private appointment details.

**Tool 2: lookup_training_package**

This tool allows customers to view available personal training packages. The customer provides a package ID, and the tool retrieves the package name, price, and number of sessions included.

Before searching the database, the tool will check that the package ID is provided and follows the correct format. If the ID is invalid or the package does not exist, the tool will return a helpful error message instead of making up information.

Both tools will only read information from the database. They will not be allowed to change appointment dates, prices, or other records.

## 4. Change Request Tool

**Tool Name: request_appointment_change**

Peak Performance Personal Training will allow clients to request changes to their existing personal training appointments through the AI assistant.

The customer will provide their appointment ID and the new date and time they would like. The tool will verify that the appointment exists, that the customer is authorized to request changes to it, and that the requested date and time are valid.

If the information is valid, the tool will create a new record in the change_requests table with a status of "waiting."

The AI assistant will not directly change the appointment. Instead, the request will appear in the Staff tab, where authorized staff can review it.

Staff members can approve or reject the request. If approved, the system will update the appointment's scheduled date and mark the request as "approved." If rejected, the appointment will remain unchanged and the request will be marked as "rejected."

This process ensures that appointment changes are reviewed by staff before they take effect.

## 6. Sensitive Data Protection

Peak Performance Personal Training will protect customers' privacy by preventing the AI assistant from collecting or storing sensitive medical information.

The system will never store medical diagnoses, injury histories, or prescription medication information in its SQLite database. This information will also never be sent to the AI model.

The AI assistant will only use the information necessary to provide its services, such as appointment IDs, scheduled training sessions, and available training packages.

If a customer attempts to share sensitive medical information, the application will prevent that information from being forwarded to the AI model and direct the customer to speak with an appropriate professional.

This policy helps protect customer privacy and keeps the AI assistant focused on appointment management and general business information.