**Here are the steps I followed to tackle this problem. Please note that I have no experience with Ruby, so steps 2 and 3 are theoretical at this point.**

### 1. Design Phase

- Understanding the context
- Modeling the data structures (see picture)
- Logic modeling (see picture)

### 2. Cleaning Phase

- Move HTTP calls to a dedicated service (remove duplicates and allow for mocking)
- Handle API errors and empty results
- Use constants to improve clarity and facilitate future changes

### 3. Implementation Phase

- Iterate on a type interface to simplify the addition of new types:
  - `BaseType` with common rules
  - `SirenType`
  - `VatType`
- Implement tests related to VAT cases

![Modeling](TrustIn.drawio.svg)
