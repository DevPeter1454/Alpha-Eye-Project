"""autogenerate tables

Revision ID: 1409c8d9a6a7
Revises: 
Create Date: 2023-10-09 18:57:36.600279

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '1409c8d9a6a7'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('hospitals',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('hospital_name', sa.String(), nullable=False),
    sa.Column('is_approved', sa.Boolean(), nullable=False),
    sa.Column('logo', sa.String(), nullable=False),
    sa.Column('address', sa.String(), nullable=False),
    sa.Column('city', sa.String(), nullable=False),
    sa.Column('state', sa.String(), nullable=False),
    sa.Column('role', sa.String(), nullable=False),
    sa.Column('created_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('updated_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('admin_email', sa.String(), nullable=False),
    sa.Column('password', sa.String(), nullable=False),
    sa.Column('license_number', sa.String(), nullable=False),
    sa.Column('hospital_id', sa.String(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('hospital_id'),
    sa.UniqueConstraint('hospital_name', name='unique_hospital_name')
    )
    op.create_index(op.f('ix_hospitals_id'), 'hospitals', ['id'], unique=False)
    op.create_table('users',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('firstname', sa.String(), nullable=False),
    sa.Column('lastname', sa.String(), nullable=False),
    sa.Column('age', sa.Integer(), nullable=False),
    sa.Column('gender', sa.String(), nullable=False),
    sa.Column('address', sa.String(), nullable=False),
    sa.Column('phone', sa.String(), nullable=False),
    sa.Column('city', sa.String(), nullable=False),
    sa.Column('state_of_residence', sa.String(), nullable=False),
    sa.Column('email', sa.String(), nullable=False),
    sa.Column('password', sa.String(), nullable=False),
    sa.Column('role', sa.String(), nullable=False),
    sa.Column('created_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('updated_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('special_id', sa.String(), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('special_id', name='unique_special_id')
    )
    op.create_index(op.f('ix_users_id'), 'users', ['id'], unique=False)
    op.create_table('doctors',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('firstname', sa.String(), nullable=False),
    sa.Column('lastname', sa.String(), nullable=False),
    sa.Column('gender', sa.String(), nullable=False),
    sa.Column('license_number', sa.String(), nullable=False),
    sa.Column('email', sa.String(), nullable=False),
    sa.Column('password', sa.String(), nullable=False),
    sa.Column('role', sa.String(), nullable=False),
    sa.Column('created_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('updated_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('hospital_name', sa.String(), nullable=False),
    sa.ForeignKeyConstraint(['hospital_name'], ['hospitals.hospital_name'], ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_doctors_id'), 'doctors', ['id'], unique=False)
    op.create_table('patients',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('firstname', sa.String(), nullable=False),
    sa.Column('lastname', sa.String(), nullable=False),
    sa.Column('age', sa.Integer(), nullable=False),
    sa.Column('gender', sa.String(), nullable=False),
    sa.Column('address', sa.String(), nullable=False),
    sa.Column('phone', sa.String(), nullable=False),
    sa.Column('city', sa.String(), nullable=False),
    sa.Column('state_of_residence', sa.String(), nullable=False),
    sa.Column('role', sa.String(), nullable=False),
    sa.Column('created_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('updated_at', sa.TIMESTAMP(), server_default=sa.text('NOW()'), nullable=True),
    sa.Column('special_id', sa.String(), nullable=False),
    sa.Column('hospital_id', sa.String(), nullable=False),
    sa.ForeignKeyConstraint(['hospital_id'], ['hospitals.hospital_id'], ),
    sa.ForeignKeyConstraint(['special_id'], ['users.special_id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_patients_id'), 'patients', ['id'], unique=False)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_patients_id'), table_name='patients')
    op.drop_table('patients')
    op.drop_index(op.f('ix_doctors_id'), table_name='doctors')
    op.drop_table('doctors')
    op.drop_index(op.f('ix_users_id'), table_name='users')
    op.drop_table('users')
    op.drop_index(op.f('ix_hospitals_id'), table_name='hospitals')
    op.drop_table('hospitals')
    # ### end Alembic commands ###
