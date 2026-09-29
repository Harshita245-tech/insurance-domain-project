-- ============================================
-- Insurance Domain Database Schema
-- ============================================

-- 1. Customers
CREATE TABLE customers (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    date_of_birth DATE,
    gender TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT
);

-- 2. Insurance Products
CREATE TABLE insurance_products (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    product_name TEXT,
    product_type TEXT,
    description TEXT,
    base_premium NUMERIC,
    coverage_amount NUMERIC
);

-- 3. Agents
CREATE TABLE agents (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    license_number TEXT,
    joining_date DATE
);

-- 4. Policies
CREATE TABLE policies (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    customer_id BIGINT,
    product_id BIGINT,
    agent_id BIGINT,
    policy_number TEXT,
    start_date DATE,
    end_date DATE,
    premium_amount NUMERIC,
    coverage_amount NUMERIC,
    policy_status TEXT,

    CONSTRAINT fk_policy_customer
        FOREIGN KEY (customer_id) REFERENCES customers(id),

    CONSTRAINT fk_policy_product
        FOREIGN KEY (product_id) REFERENCES insurance_products(id),

    CONSTRAINT fk_policy_agent
        FOREIGN KEY (agent_id) REFERENCES agents(id)
);

-- 5. Claims
CREATE TABLE claims (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    policy_id BIGINT,
    claim_number TEXT,
    claim_date DATE,
    claim_amount NUMERIC,
    approved_amount NUMERIC,
    claim_status TEXT,
    description TEXT,

    CONSTRAINT fk_claim_policy
        FOREIGN KEY (policy_id) REFERENCES policies(id)
);

-- 6. Payments
CREATE TABLE payments (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    policy_id BIGINT,
    payment_date DATE,
    amount NUMERIC,
    payment_method TEXT,
    payment_status TEXT,
    transaction_reference TEXT,

    CONSTRAINT fk_payment_policy
        FOREIGN KEY (policy_id) REFERENCES policies(id)
);
