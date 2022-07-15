PGDMP                          z         
   saas-promo    13.4 (Debian 13.4-4.pgdg110+1)    13.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32768 
   saas-promo    DATABASE     `   CREATE DATABASE "saas-promo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE "saas-promo";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    32824    int_reward_campaigns    TABLE     E  CREATE TABLE public.int_reward_campaigns (
    id integer NOT NULL,
    reward_partner_id integer NOT NULL,
    type character varying(25) NOT NULL,
    value character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    included_product character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 (   DROP TABLE public.int_reward_campaigns;
       public         heap 
   saas-promo    false    3            �            1259    32801    int_reward_campaigns_approvals    TABLE     X  CREATE TABLE public.int_reward_campaigns_approvals (
    id integer NOT NULL,
    reward_partner_id integer NOT NULL,
    type character varying(25) NOT NULL,
    value character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    included_product character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 2   DROP TABLE public.int_reward_campaigns_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32799 %   int_reward_campaigns_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_campaigns_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.int_reward_campaigns_approvals_id_seq;
       public       
   saas-promo    false    206    3            �           0    0 %   int_reward_campaigns_approvals_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.int_reward_campaigns_approvals_id_seq OWNED BY public.int_reward_campaigns_approvals.id;
          public       
   saas-promo    false    205            �            1259    32822    int_reward_campaigns_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_campaigns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.int_reward_campaigns_id_seq;
       public       
   saas-promo    false    210    3            �           0    0    int_reward_campaigns_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.int_reward_campaigns_id_seq OWNED BY public.int_reward_campaigns.id;
          public       
   saas-promo    false    209            �            1259    32790    int_reward_notifications    TABLE     U  CREATE TABLE public.int_reward_notifications (
    id integer NOT NULL,
    reward_redemption_id integer NOT NULL,
    notification_name character varying(25) NOT NULL,
    status character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    cclist character varying(255) NOT NULL,
    channel character varying(255) NOT NULL,
    subject character varying(25) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 ,   DROP TABLE public.int_reward_notifications;
       public         heap 
   saas-promo    false    3            �            1259    32788    int_reward_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.int_reward_notifications_id_seq;
       public       
   saas-promo    false    204    3            �           0    0    int_reward_notifications_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.int_reward_notifications_id_seq OWNED BY public.int_reward_notifications.id;
          public       
   saas-promo    false    203            �            1259    32847    int_reward_partners    TABLE     )  CREATE TABLE public.int_reward_partners (
    id integer NOT NULL,
    code character varying(25) NOT NULL,
    name character varying(25) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    selected_icon character varying(255) NOT NULL,
    non_selected_icon character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 '   DROP TABLE public.int_reward_partners;
       public         heap 
   saas-promo    false    3            �            1259    32813    int_reward_partners_approvals    TABLE     <  CREATE TABLE public.int_reward_partners_approvals (
    id integer NOT NULL,
    code character varying(25) NOT NULL,
    name character varying(25) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    selected_icon character varying(255) NOT NULL,
    non_selected_icon character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 1   DROP TABLE public.int_reward_partners_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32811 $   int_reward_partners_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_partners_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.int_reward_partners_approvals_id_seq;
       public       
   saas-promo    false    3    208            �           0    0 $   int_reward_partners_approvals_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.int_reward_partners_approvals_id_seq OWNED BY public.int_reward_partners_approvals.id;
          public       
   saas-promo    false    207            �            1259    32845    int_reward_partners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.int_reward_partners_id_seq;
       public       
   saas-promo    false    3    214            �           0    0    int_reward_partners_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.int_reward_partners_id_seq OWNED BY public.int_reward_partners.id;
          public       
   saas-promo    false    213            �            1259    32836    int_reward_redemptions    TABLE     �  CREATE TABLE public.int_reward_redemptions (
    id integer NOT NULL,
    reward_campaign_id integer NOT NULL,
    sales_type character varying(25) NOT NULL,
    quotation_number character varying(255) NOT NULL,
    policy_number character varying(255) NOT NULL,
    product character varying(255) NOT NULL,
    promo_code character varying(255) NOT NULL,
    policy_purchase_date timestamp without time zone NOT NULL,
    cross_sell_policy_number character varying(255) NOT NULL,
    nric character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    policy_inception_date timestamp without time zone NOT NULL,
    projected_delivery_date timestamp without time zone NOT NULL,
    redemption_notification_status character varying(255) NOT NULL,
    mobile_no character varying(255) NOT NULL,
    hash_key character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 *   DROP TABLE public.int_reward_redemptions;
       public         heap 
   saas-promo    false    3            �            1259    32834    int_reward_redemptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.int_reward_redemptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.int_reward_redemptions_id_seq;
       public       
   saas-promo    false    212    3            �           0    0    int_reward_redemptions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.int_reward_redemptions_id_seq OWNED BY public.int_reward_redemptions.id;
          public       
   saas-promo    false    211            �            1259    32869 !   promo_additional_voucher_discount    TABLE     n  CREATE TABLE public.promo_additional_voucher_discount (
    id integer NOT NULL,
    promo_code_id integer NOT NULL,
    additional_type character varying(255) NOT NULL,
    discount_type character varying(255) NOT NULL,
    additional_value integer DEFAULT 0 NOT NULL,
    voucher_label character varying NOT NULL,
    product_plan character varying(50) NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL,
    "updatedAt" character varying(255) NOT NULL
);
 5   DROP TABLE public.promo_additional_voucher_discount;
       public         heap 
   saas-promo    false    3            �            1259    32882 +   promo_additional_voucher_discount_approvals    TABLE     }  CREATE TABLE public.promo_additional_voucher_discount_approvals (
    id integer NOT NULL,
    promo_code_id integer NOT NULL,
    additional_type character varying(255) NOT NULL,
    discount_type character varying(255) NOT NULL,
    additional_value integer DEFAULT 0 NOT NULL,
    voucher_label character varying NOT NULL,
    product_plan character varying(50) NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 ?   DROP TABLE public.promo_additional_voucher_discount_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32880 2   promo_additional_voucher_discount_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_additional_voucher_discount_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.promo_additional_voucher_discount_approvals_id_seq;
       public       
   saas-promo    false    3    220            �           0    0 2   promo_additional_voucher_discount_approvals_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.promo_additional_voucher_discount_approvals_id_seq OWNED BY public.promo_additional_voucher_discount_approvals.id;
          public       
   saas-promo    false    219            �            1259    32867 (   promo_additional_voucher_discount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_additional_voucher_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.promo_additional_voucher_discount_id_seq;
       public       
   saas-promo    false    3    218            �           0    0 (   promo_additional_voucher_discount_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.promo_additional_voucher_discount_id_seq OWNED BY public.promo_additional_voucher_discount.id;
          public       
   saas-promo    false    217            �            1259    32908    promo_config_lookups    TABLE     �  CREATE TABLE public.promo_config_lookups (
    id integer NOT NULL,
    config_type integer NOT NULL,
    product_name integer NOT NULL,
    config_key character varying(50) NOT NULL,
    config_label character varying(50) NOT NULL,
    sequence integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 (   DROP TABLE public.promo_config_lookups;
       public         heap 
   saas-promo    false    3            �            1259    32906    promo_config_lookups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_config_lookups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.promo_config_lookups_id_seq;
       public       
   saas-promo    false    224    3            �           0    0    promo_config_lookups_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.promo_config_lookups_id_seq OWNED BY public.promo_config_lookups.id;
          public       
   saas-promo    false    223            �            1259    32895    promo_core_system_discounts    TABLE     A  CREATE TABLE public.promo_core_system_discounts (
    id integer NOT NULL,
    country_code integer NOT NULL,
    core_system character varying NOT NULL,
    core_system_code character varying(60) NOT NULL,
    core_system_discount_type character varying NOT NULL,
    core_system_discount_value integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 /   DROP TABLE public.promo_core_system_discounts;
       public         heap 
   saas-promo    false    3            �            1259    32893 "   promo_core_system_discounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_core_system_discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.promo_core_system_discounts_id_seq;
       public       
   saas-promo    false    3    222            �           0    0 "   promo_core_system_discounts_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.promo_core_system_discounts_id_seq OWNED BY public.promo_core_system_discounts.id;
          public       
   saas-promo    false    221            �            1259    32919 "   promo_discount_layering_permission    TABLE     �  CREATE TABLE public.promo_discount_layering_permission (
    id integer NOT NULL,
    self_tier integer NOT NULL,
    allow_t1 boolean DEFAULT false NOT NULL,
    allow_t2 boolean DEFAULT false NOT NULL,
    allow_t3 boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 6   DROP TABLE public.promo_discount_layering_permission;
       public         heap 
   saas-promo    false    3            �            1259    32917 )   promo_discount_layering_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_discount_layering_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.promo_discount_layering_permission_id_seq;
       public       
   saas-promo    false    3    226            �           0    0 )   promo_discount_layering_permission_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.promo_discount_layering_permission_id_seq OWNED BY public.promo_discount_layering_permission.id;
          public       
   saas-promo    false    225            �            1259    32933    promo_discount_tier    TABLE     �  CREATE TABLE public.promo_discount_tier (
    id integer NOT NULL,
    country_code integer NOT NULL,
    tier_id integer NOT NULL,
    tier_parent_type character varying(255) NOT NULL,
    tier_type character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 '   DROP TABLE public.promo_discount_tier;
       public         heap 
   saas-promo    false    3            �            1259    32931    promo_discount_tier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_discount_tier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.promo_discount_tier_id_seq;
       public       
   saas-promo    false    3    228            �           0    0    promo_discount_tier_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.promo_discount_tier_id_seq OWNED BY public.promo_discount_tier.id;
          public       
   saas-promo    false    227            �            1259    32944    promo_master_discounts    TABLE     �  CREATE TABLE public.promo_master_discounts (
    id integer NOT NULL,
    discount_tier_id integer NOT NULL,
    discount_tier_type integer NOT NULL,
    product_name character varying(255) NOT NULL,
    frontend_code character varying(255) NOT NULL,
    discount_type character varying(255) NOT NULL,
    discount_value integer DEFAULT 0 NOT NULL,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    status character varying(12) NOT NULL,
    discount_rules character varying NOT NULL,
    layer_permission integer NOT NULL,
    marketing_remarks character varying NOT NULL,
    alt_promo_code_id integer NOT NULL,
    parent_alt_promo_code_id integer NOT NULL,
    applicable_to character varying NOT NULL,
    quota integer DEFAULT 0 NOT NULL,
    frontend_label character varying NOT NULL,
    voucher_value integer DEFAULT 0 NOT NULL,
    voucher_label character varying NOT NULL,
    promo_page_header_label character varying NOT NULL,
    promo_page_body_label character varying NOT NULL,
    promo_card_behavior integer DEFAULT 0 NOT NULL,
    "showAtPromoPage" boolean DEFAULT false NOT NULL,
    tnc_file character varying NOT NULL,
    generic_voucher integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 *   DROP TABLE public.promo_master_discounts;
       public         heap 
   saas-promo    false    3            �            1259    32961     promo_master_discounts_approvals    TABLE     �  CREATE TABLE public.promo_master_discounts_approvals (
    id integer NOT NULL,
    discount_tier_id integer NOT NULL,
    discount_tier_type integer NOT NULL,
    product_name character varying(255) NOT NULL,
    frontend_code character varying(255) NOT NULL,
    discount_type character varying(255) NOT NULL,
    discount_value integer DEFAULT 0 NOT NULL,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    status character varying(12) NOT NULL,
    discount_rules character varying NOT NULL,
    layer_permission integer NOT NULL,
    marketing_remarks character varying NOT NULL,
    alt_promo_code_id integer NOT NULL,
    parent_alt_promo_code_id integer NOT NULL,
    applicable_to character varying NOT NULL,
    quota integer DEFAULT 0 NOT NULL,
    frontend_label character varying NOT NULL,
    voucher_value integer DEFAULT 0 NOT NULL,
    voucher_label character varying NOT NULL,
    promo_page_header_label character varying NOT NULL,
    promo_page_body_label character varying NOT NULL,
    promo_card_behavior integer DEFAULT 0 NOT NULL,
    "showAtPromoPage" boolean DEFAULT false NOT NULL,
    tnc_file character varying NOT NULL,
    generic_voucher integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 4   DROP TABLE public.promo_master_discounts_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32959 '   promo_master_discounts_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_master_discounts_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.promo_master_discounts_approvals_id_seq;
       public       
   saas-promo    false    232    3            �           0    0 '   promo_master_discounts_approvals_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.promo_master_discounts_approvals_id_seq OWNED BY public.promo_master_discounts_approvals.id;
          public       
   saas-promo    false    231            �            1259    32942    promo_master_discounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_master_discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.promo_master_discounts_id_seq;
       public       
   saas-promo    false    3    230            �           0    0    promo_master_discounts_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.promo_master_discounts_id_seq OWNED BY public.promo_master_discounts.id;
          public       
   saas-promo    false    229            �            1259    32978    promo_page_inclusions    TABLE     [  CREATE TABLE public.promo_page_inclusions (
    id integer NOT NULL,
    promo_page_id integer NOT NULL,
    promo_code_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 )   DROP TABLE public.promo_page_inclusions;
       public         heap 
   saas-promo    false    3            �            1259    32858    promo_page_inclusions_approvals    TABLE     n  CREATE TABLE public.promo_page_inclusions_approvals (
    id integer NOT NULL,
    promo_page_id integer NOT NULL,
    promo_code_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 3   DROP TABLE public.promo_page_inclusions_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32856 &   promo_page_inclusions_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_page_inclusions_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.promo_page_inclusions_approvals_id_seq;
       public       
   saas-promo    false    3    216            �           0    0 &   promo_page_inclusions_approvals_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.promo_page_inclusions_approvals_id_seq OWNED BY public.promo_page_inclusions_approvals.id;
          public       
   saas-promo    false    215            �            1259    32976    promo_page_inclusions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_page_inclusions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.promo_page_inclusions_id_seq;
       public       
   saas-promo    false    234    3            �           0    0    promo_page_inclusions_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.promo_page_inclusions_id_seq OWNED BY public.promo_page_inclusions.id;
          public       
   saas-promo    false    233            �            1259    33004    promo_pages    TABLE       CREATE TABLE public.promo_pages (
    id integer NOT NULL,
    page_name character varying(100) NOT NULL,
    page_description integer NOT NULL,
    applicable_page character varying(60) NOT NULL,
    product_name character varying(50) NOT NULL,
    utm_source character varying(255) NOT NULL,
    campaign character varying(255) NOT NULL,
    sub_campaign character varying(255) NOT NULL,
    should_show_label boolean DEFAULT false NOT NULL,
    time_show_time_thold integer NOT NULL,
    time_switch_format_thold integer NOT NULL,
    time_total_redemption_label character varying NOT NULL,
    time_show_total_redemption boolean DEFAULT false NOT NULL,
    quota_total_label character varying NOT NULL,
    quota_left_label character varying NOT NULL,
    quota_full_label character varying NOT NULL,
    quota_switch_format_thold integer NOT NULL,
    status character varying(20) NOT NULL,
    baseline boolean DEFAULT false NOT NULL,
    has_tnc boolean DEFAULT false NOT NULL,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
    DROP TABLE public.promo_pages;
       public         heap 
   saas-promo    false    3            �            1259    32989    promo_pages_approvals    TABLE     "  CREATE TABLE public.promo_pages_approvals (
    id integer NOT NULL,
    page_name character varying(100) NOT NULL,
    page_description integer NOT NULL,
    applicable_page character varying(60) NOT NULL,
    product_name character varying(50) NOT NULL,
    utm_source character varying(255) NOT NULL,
    campaign character varying(255) NOT NULL,
    sub_campaign character varying(255) NOT NULL,
    should_show_label boolean DEFAULT false NOT NULL,
    time_show_time_thold integer NOT NULL,
    time_switch_format_thold integer NOT NULL,
    time_total_redemption_label character varying NOT NULL,
    time_show_total_redemption boolean DEFAULT false NOT NULL,
    quota_total_label character varying NOT NULL,
    quota_left_label character varying NOT NULL,
    quota_full_label character varying NOT NULL,
    quota_switch_format_thold integer NOT NULL,
    status character varying(20) NOT NULL,
    baseline boolean DEFAULT false NOT NULL,
    has_tnc boolean DEFAULT false NOT NULL,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 )   DROP TABLE public.promo_pages_approvals;
       public         heap 
   saas-promo    false    3            �            1259    32987    promo_pages_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_pages_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.promo_pages_approvals_id_seq;
       public       
   saas-promo    false    236    3            �           0    0    promo_pages_approvals_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.promo_pages_approvals_id_seq OWNED BY public.promo_pages_approvals.id;
          public       
   saas-promo    false    235            �            1259    33002    promo_pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.promo_pages_id_seq;
       public       
   saas-promo    false    3    238            �           0    0    promo_pages_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.promo_pages_id_seq OWNED BY public.promo_pages.id;
          public       
   saas-promo    false    237            �            1259    33030    promo_products_approvals    TABLE     �  CREATE TABLE public.promo_products_approvals (
    id integer NOT NULL,
    country_code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    sequence integer NOT NULL,
    promo_page_icon_filename character varying NOT NULL,
    tnc_file character varying NOT NULL,
    table_label character varying NOT NULL,
    show_banner character varying NOT NULL,
    show_promo_section character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL,
    "approvalStatus" character varying(256) NOT NULL,
    "rejectionRemarks" character varying NOT NULL,
    "approvedBy" character varying(256) NOT NULL,
    "approvedAt" timestamp without time zone NOT NULL,
    "rejectedAt" timestamp without time zone NOT NULL
);
 ,   DROP TABLE public.promo_products_approvals;
       public         heap 
   saas-promo    false    3            �            1259    33028    promo_products_approvals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_products_approvals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.promo_products_approvals_id_seq;
       public       
   saas-promo    false    3    242            �           0    0    promo_products_approvals_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.promo_products_approvals_id_seq OWNED BY public.promo_products_approvals.id;
          public       
   saas-promo    false    241            �            1259    33019    promo_redemptions    TABLE     �  CREATE TABLE public.promo_redemptions (
    id integer NOT NULL,
    promo_code_id integer NOT NULL,
    nric character varying(25) NOT NULL,
    policy_quotation_no character varying(30) NOT NULL,
    policy_number character varying(30) NOT NULL,
    status character varying(30) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    "updatedBy" character varying(255) NOT NULL
);
 %   DROP TABLE public.promo_redemptions;
       public         heap 
   saas-promo    false    3            �            1259    33017    promo_redemptions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promo_redemptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.promo_redemptions_id_seq;
       public       
   saas-promo    false    240    3            �           0    0    promo_redemptions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.promo_redemptions_id_seq OWNED BY public.promo_redemptions.id;
          public       
   saas-promo    false    239            �            1259    32782    typeorm_metadata    TABLE     �   CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);
 $   DROP TABLE public.typeorm_metadata;
       public         heap 
   saas-promo    false    3            �            1259    32772    users    TABLE     `   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap 
   saas-promo    false    3            �            1259    32770    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       
   saas-promo    false    3    201            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       
   saas-promo    false    200            �           2604    32827    int_reward_campaigns id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_campaigns ALTER COLUMN id SET DEFAULT nextval('public.int_reward_campaigns_id_seq'::regclass);
 F   ALTER TABLE public.int_reward_campaigns ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    210    209    210            �           2604    32804 !   int_reward_campaigns_approvals id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_campaigns_approvals ALTER COLUMN id SET DEFAULT nextval('public.int_reward_campaigns_approvals_id_seq'::regclass);
 P   ALTER TABLE public.int_reward_campaigns_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    206    205    206            �           2604    32793    int_reward_notifications id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_notifications ALTER COLUMN id SET DEFAULT nextval('public.int_reward_notifications_id_seq'::regclass);
 J   ALTER TABLE public.int_reward_notifications ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    204    203    204            �           2604    32850    int_reward_partners id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_partners ALTER COLUMN id SET DEFAULT nextval('public.int_reward_partners_id_seq'::regclass);
 E   ALTER TABLE public.int_reward_partners ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    214    213    214            �           2604    32816     int_reward_partners_approvals id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_partners_approvals ALTER COLUMN id SET DEFAULT nextval('public.int_reward_partners_approvals_id_seq'::regclass);
 O   ALTER TABLE public.int_reward_partners_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    207    208    208            �           2604    32839    int_reward_redemptions id    DEFAULT     �   ALTER TABLE ONLY public.int_reward_redemptions ALTER COLUMN id SET DEFAULT nextval('public.int_reward_redemptions_id_seq'::regclass);
 H   ALTER TABLE public.int_reward_redemptions ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    211    212    212            �           2604    32872 $   promo_additional_voucher_discount id    DEFAULT     �   ALTER TABLE ONLY public.promo_additional_voucher_discount ALTER COLUMN id SET DEFAULT nextval('public.promo_additional_voucher_discount_id_seq'::regclass);
 S   ALTER TABLE public.promo_additional_voucher_discount ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    218    217    218            �           2604    32885 .   promo_additional_voucher_discount_approvals id    DEFAULT     �   ALTER TABLE ONLY public.promo_additional_voucher_discount_approvals ALTER COLUMN id SET DEFAULT nextval('public.promo_additional_voucher_discount_approvals_id_seq'::regclass);
 ]   ALTER TABLE public.promo_additional_voucher_discount_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    219    220    220            �           2604    32911    promo_config_lookups id    DEFAULT     �   ALTER TABLE ONLY public.promo_config_lookups ALTER COLUMN id SET DEFAULT nextval('public.promo_config_lookups_id_seq'::regclass);
 F   ALTER TABLE public.promo_config_lookups ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    223    224    224            �           2604    32898    promo_core_system_discounts id    DEFAULT     �   ALTER TABLE ONLY public.promo_core_system_discounts ALTER COLUMN id SET DEFAULT nextval('public.promo_core_system_discounts_id_seq'::regclass);
 M   ALTER TABLE public.promo_core_system_discounts ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    221    222    222            �           2604    32922 %   promo_discount_layering_permission id    DEFAULT     �   ALTER TABLE ONLY public.promo_discount_layering_permission ALTER COLUMN id SET DEFAULT nextval('public.promo_discount_layering_permission_id_seq'::regclass);
 T   ALTER TABLE public.promo_discount_layering_permission ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    225    226    226            �           2604    32936    promo_discount_tier id    DEFAULT     �   ALTER TABLE ONLY public.promo_discount_tier ALTER COLUMN id SET DEFAULT nextval('public.promo_discount_tier_id_seq'::regclass);
 E   ALTER TABLE public.promo_discount_tier ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    227    228    228            �           2604    32947    promo_master_discounts id    DEFAULT     �   ALTER TABLE ONLY public.promo_master_discounts ALTER COLUMN id SET DEFAULT nextval('public.promo_master_discounts_id_seq'::regclass);
 H   ALTER TABLE public.promo_master_discounts ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    229    230    230            �           2604    32964 #   promo_master_discounts_approvals id    DEFAULT     �   ALTER TABLE ONLY public.promo_master_discounts_approvals ALTER COLUMN id SET DEFAULT nextval('public.promo_master_discounts_approvals_id_seq'::regclass);
 R   ALTER TABLE public.promo_master_discounts_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    232    231    232            �           2604    32981    promo_page_inclusions id    DEFAULT     �   ALTER TABLE ONLY public.promo_page_inclusions ALTER COLUMN id SET DEFAULT nextval('public.promo_page_inclusions_id_seq'::regclass);
 G   ALTER TABLE public.promo_page_inclusions ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    233    234    234            �           2604    32861 "   promo_page_inclusions_approvals id    DEFAULT     �   ALTER TABLE ONLY public.promo_page_inclusions_approvals ALTER COLUMN id SET DEFAULT nextval('public.promo_page_inclusions_approvals_id_seq'::regclass);
 Q   ALTER TABLE public.promo_page_inclusions_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    216    215    216            �           2604    33007    promo_pages id    DEFAULT     p   ALTER TABLE ONLY public.promo_pages ALTER COLUMN id SET DEFAULT nextval('public.promo_pages_id_seq'::regclass);
 =   ALTER TABLE public.promo_pages ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    238    237    238            �           2604    32992    promo_pages_approvals id    DEFAULT     �   ALTER TABLE ONLY public.promo_pages_approvals ALTER COLUMN id SET DEFAULT nextval('public.promo_pages_approvals_id_seq'::regclass);
 G   ALTER TABLE public.promo_pages_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    236    235    236            �           2604    33033    promo_products_approvals id    DEFAULT     �   ALTER TABLE ONLY public.promo_products_approvals ALTER COLUMN id SET DEFAULT nextval('public.promo_products_approvals_id_seq'::regclass);
 J   ALTER TABLE public.promo_products_approvals ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    241    242    242            �           2604    33022    promo_redemptions id    DEFAULT     |   ALTER TABLE ONLY public.promo_redemptions ALTER COLUMN id SET DEFAULT nextval('public.promo_redemptions_id_seq'::regclass);
 C   ALTER TABLE public.promo_redemptions ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    240    239    240            �           2604    32775    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       
   saas-promo    false    200    201    201            �          0    32824    int_reward_campaigns 
   TABLE DATA           �   COPY public.int_reward_campaigns (id, reward_partner_id, type, value, code, included_product, active, end_at, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    210   #	      �          0    32801    int_reward_campaigns_approvals 
   TABLE DATA             COPY public.int_reward_campaigns_approvals (id, reward_partner_id, type, value, code, included_product, active, end_at, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    206   @	      �          0    32790    int_reward_notifications 
   TABLE DATA           �   COPY public.int_reward_notifications (id, reward_redemption_id, notification_name, status, content, cclist, channel, subject, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    204   ]	      �          0    32847    int_reward_partners 
   TABLE DATA           �   COPY public.int_reward_partners (id, code, name, label, description, selected_icon, non_selected_icon, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    214   z	      �          0    32813    int_reward_partners_approvals 
   TABLE DATA           �   COPY public.int_reward_partners_approvals (id, code, name, label, description, selected_icon, non_selected_icon, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    208   �	      �          0    32836    int_reward_redemptions 
   TABLE DATA           �  COPY public.int_reward_redemptions (id, reward_campaign_id, sales_type, quotation_number, policy_number, product, promo_code, policy_purchase_date, cross_sell_policy_number, nric, name, email, status, policy_inception_date, projected_delivery_date, redemption_notification_status, mobile_no, hash_key, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    212   �	      �          0    32869 !   promo_additional_voucher_discount 
   TABLE DATA           +  COPY public.promo_additional_voucher_discount (id, promo_code_id, additional_type, discount_type, additional_value, voucher_label, product_plan, "isActive", created_at, created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt", "updatedAt") FROM stdin;
    public       
   saas-promo    false    218   �	      �          0    32882 +   promo_additional_voucher_discount_approvals 
   TABLE DATA           5  COPY public.promo_additional_voucher_discount_approvals (id, promo_code_id, additional_type, discount_type, additional_value, voucher_label, product_plan, "isActive", created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    220   �	      �          0    32908    promo_config_lookups 
   TABLE DATA           �   COPY public.promo_config_lookups (id, config_type, product_name, config_key, config_label, sequence, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    224   
      �          0    32895    promo_core_system_discounts 
   TABLE DATA           �   COPY public.promo_core_system_discounts (id, country_code, core_system, core_system_code, core_system_discount_type, core_system_discount_value, "isActive", created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    222   (
      �          0    32919 "   promo_discount_layering_permission 
   TABLE DATA           �   COPY public.promo_discount_layering_permission (id, self_tier, allow_t1, allow_t2, allow_t3, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    226   E
      �          0    32933    promo_discount_tier 
   TABLE DATA           �   COPY public.promo_discount_tier (id, country_code, tier_id, tier_parent_type, tier_type, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    228   b
      �          0    32944    promo_master_discounts 
   TABLE DATA           O  COPY public.promo_master_discounts (id, discount_tier_id, discount_tier_type, product_name, frontend_code, discount_type, discount_value, valid_from, valid_to, status, discount_rules, layer_permission, marketing_remarks, alt_promo_code_id, parent_alt_promo_code_id, applicable_to, quota, frontend_label, voucher_value, voucher_label, promo_page_header_label, promo_page_body_label, promo_card_behavior, "showAtPromoPage", tnc_file, generic_voucher, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    230   
      �          0    32961     promo_master_discounts_approvals 
   TABLE DATA           Y  COPY public.promo_master_discounts_approvals (id, discount_tier_id, discount_tier_type, product_name, frontend_code, discount_type, discount_value, valid_from, valid_to, status, discount_rules, layer_permission, marketing_remarks, alt_promo_code_id, parent_alt_promo_code_id, applicable_to, quota, frontend_label, voucher_value, voucher_label, promo_page_header_label, promo_page_body_label, promo_card_behavior, "showAtPromoPage", tnc_file, generic_voucher, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    232   �
      �          0    32978    promo_page_inclusions 
   TABLE DATA           �   COPY public.promo_page_inclusions (id, promo_page_id, promo_code_id, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    234   �
      �          0    32858    promo_page_inclusions_approvals 
   TABLE DATA           �   COPY public.promo_page_inclusions_approvals (id, promo_page_id, promo_code_id, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    216   �
      �          0    33004    promo_pages 
   TABLE DATA           �  COPY public.promo_pages (id, page_name, page_description, applicable_page, product_name, utm_source, campaign, sub_campaign, should_show_label, time_show_time_thold, time_switch_format_thold, time_total_redemption_label, time_show_total_redemption, quota_total_label, quota_left_label, quota_full_label, quota_switch_format_thold, status, baseline, has_tnc, valid_from, valid_to, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    238   �
      �          0    32989    promo_pages_approvals 
   TABLE DATA             COPY public.promo_pages_approvals (id, page_name, page_description, applicable_page, product_name, utm_source, campaign, sub_campaign, should_show_label, time_show_time_thold, time_switch_format_thold, time_total_redemption_label, time_show_total_redemption, quota_total_label, quota_left_label, quota_full_label, quota_switch_format_thold, status, baseline, has_tnc, valid_from, valid_to, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    236         �          0    33030    promo_products_approvals 
   TABLE DATA           (  COPY public.promo_products_approvals (id, country_code, name, sequence, promo_page_icon_filename, tnc_file, table_label, show_banner, show_promo_section, created_at, "updatedAt", created_by, "updatedBy", "approvalStatus", "rejectionRemarks", "approvedBy", "approvedAt", "rejectedAt") FROM stdin;
    public       
   saas-promo    false    242   -      �          0    33019    promo_redemptions 
   TABLE DATA           �   COPY public.promo_redemptions (id, promo_code_id, nric, policy_quotation_no, policy_number, status, created_at, "updatedAt", created_by, "updatedBy") FROM stdin;
    public       
   saas-promo    false    240   J      �          0    32782    typeorm_metadata 
   TABLE DATA           X   COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
    public       
   saas-promo    false    202   g      �          0    32772    users 
   TABLE DATA           -   COPY public.users (id, username) FROM stdin;
    public       
   saas-promo    false    201   �      �           0    0 %   int_reward_campaigns_approvals_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.int_reward_campaigns_approvals_id_seq', 1, false);
          public       
   saas-promo    false    205            �           0    0    int_reward_campaigns_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.int_reward_campaigns_id_seq', 1, false);
          public       
   saas-promo    false    209            �           0    0    int_reward_notifications_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.int_reward_notifications_id_seq', 1, false);
          public       
   saas-promo    false    203            �           0    0 $   int_reward_partners_approvals_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.int_reward_partners_approvals_id_seq', 1, false);
          public       
   saas-promo    false    207            �           0    0    int_reward_partners_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.int_reward_partners_id_seq', 1, false);
          public       
   saas-promo    false    213            �           0    0    int_reward_redemptions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.int_reward_redemptions_id_seq', 1, false);
          public       
   saas-promo    false    211            �           0    0 2   promo_additional_voucher_discount_approvals_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.promo_additional_voucher_discount_approvals_id_seq', 1, false);
          public       
   saas-promo    false    219            �           0    0 (   promo_additional_voucher_discount_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.promo_additional_voucher_discount_id_seq', 1, false);
          public       
   saas-promo    false    217            �           0    0    promo_config_lookups_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.promo_config_lookups_id_seq', 1, false);
          public       
   saas-promo    false    223            �           0    0 "   promo_core_system_discounts_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.promo_core_system_discounts_id_seq', 1, false);
          public       
   saas-promo    false    221            �           0    0 )   promo_discount_layering_permission_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.promo_discount_layering_permission_id_seq', 1, false);
          public       
   saas-promo    false    225            �           0    0    promo_discount_tier_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.promo_discount_tier_id_seq', 1, false);
          public       
   saas-promo    false    227            �           0    0 '   promo_master_discounts_approvals_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.promo_master_discounts_approvals_id_seq', 1, false);
          public       
   saas-promo    false    231            �           0    0    promo_master_discounts_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.promo_master_discounts_id_seq', 1, false);
          public       
   saas-promo    false    229            �           0    0 &   promo_page_inclusions_approvals_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.promo_page_inclusions_approvals_id_seq', 1, false);
          public       
   saas-promo    false    215            �           0    0    promo_page_inclusions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.promo_page_inclusions_id_seq', 1, false);
          public       
   saas-promo    false    233            �           0    0    promo_pages_approvals_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.promo_pages_approvals_id_seq', 1, false);
          public       
   saas-promo    false    235            �           0    0    promo_pages_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.promo_pages_id_seq', 1, false);
          public       
   saas-promo    false    237            �           0    0    promo_products_approvals_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.promo_products_approvals_id_seq', 1, false);
          public       
   saas-promo    false    241            �           0    0    promo_redemptions_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.promo_redemptions_id_seq', 1, false);
          public       
   saas-promo    false    239            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public       
   saas-promo    false    200            �           2606    32810 =   int_reward_campaigns_approvals PK_02a9d27e70d72f3b42debd5ece1 
   CONSTRAINT     }   ALTER TABLE ONLY public.int_reward_campaigns_approvals
    ADD CONSTRAINT "PK_02a9d27e70d72f3b42debd5ece1" PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.int_reward_campaigns_approvals DROP CONSTRAINT "PK_02a9d27e70d72f3b42debd5ece1";
       public         
   saas-promo    false    206            �           2606    32892 J   promo_additional_voucher_discount_approvals PK_02bbb6c1a3b61aa847d6fb7af24 
   CONSTRAINT     �   ALTER TABLE ONLY public.promo_additional_voucher_discount_approvals
    ADD CONSTRAINT "PK_02bbb6c1a3b61aa847d6fb7af24" PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.promo_additional_voucher_discount_approvals DROP CONSTRAINT "PK_02bbb6c1a3b61aa847d6fb7af24";
       public         
   saas-promo    false    220                       2606    33016 *   promo_pages PK_1099c8a7dac53f7ec42c12611d5 
   CONSTRAINT     j   ALTER TABLE ONLY public.promo_pages
    ADD CONSTRAINT "PK_1099c8a7dac53f7ec42c12611d5" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.promo_pages DROP CONSTRAINT "PK_1099c8a7dac53f7ec42c12611d5";
       public         
   saas-promo    false    238                       2606    32986 4   promo_page_inclusions PK_2f2df5d84f8a5d1d6b657389535 
   CONSTRAINT     t   ALTER TABLE ONLY public.promo_page_inclusions
    ADD CONSTRAINT "PK_2f2df5d84f8a5d1d6b657389535" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.promo_page_inclusions DROP CONSTRAINT "PK_2f2df5d84f8a5d1d6b657389535";
       public         
   saas-promo    false    234                       2606    33027 0   promo_redemptions PK_34a930e5657a7e0a837b0bb41c9 
   CONSTRAINT     p   ALTER TABLE ONLY public.promo_redemptions
    ADD CONSTRAINT "PK_34a930e5657a7e0a837b0bb41c9" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.promo_redemptions DROP CONSTRAINT "PK_34a930e5657a7e0a837b0bb41c9";
       public         
   saas-promo    false    240            �           2606    32833 3   int_reward_campaigns PK_3b1e3e1e8b6b90c09449bfa280e 
   CONSTRAINT     s   ALTER TABLE ONLY public.int_reward_campaigns
    ADD CONSTRAINT "PK_3b1e3e1e8b6b90c09449bfa280e" PRIMARY KEY (id);
 _   ALTER TABLE ONLY public.int_reward_campaigns DROP CONSTRAINT "PK_3b1e3e1e8b6b90c09449bfa280e";
       public         
   saas-promo    false    210            �           2606    32798 7   int_reward_notifications PK_3d3be290df2550839075c3a35dc 
   CONSTRAINT     w   ALTER TABLE ONLY public.int_reward_notifications
    ADD CONSTRAINT "PK_3d3be290df2550839075c3a35dc" PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.int_reward_notifications DROP CONSTRAINT "PK_3d3be290df2550839075c3a35dc";
       public         
   saas-promo    false    204            �           2606    32855 2   int_reward_partners PK_3fbde3413cf7ee6860972dd9438 
   CONSTRAINT     r   ALTER TABLE ONLY public.int_reward_partners
    ADD CONSTRAINT "PK_3fbde3413cf7ee6860972dd9438" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.int_reward_partners DROP CONSTRAINT "PK_3fbde3413cf7ee6860972dd9438";
       public         
   saas-promo    false    214                       2606    32916 3   promo_config_lookups PK_5cd0dc18513dffc7c7ef71ed454 
   CONSTRAINT     s   ALTER TABLE ONLY public.promo_config_lookups
    ADD CONSTRAINT "PK_5cd0dc18513dffc7c7ef71ed454" PRIMARY KEY (id);
 _   ALTER TABLE ONLY public.promo_config_lookups DROP CONSTRAINT "PK_5cd0dc18513dffc7c7ef71ed454";
       public         
   saas-promo    false    224                        2606    32905 :   promo_core_system_discounts PK_5fb1bcfca1b0dca801ad8939fa6 
   CONSTRAINT     z   ALTER TABLE ONLY public.promo_core_system_discounts
    ADD CONSTRAINT "PK_5fb1bcfca1b0dca801ad8939fa6" PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.promo_core_system_discounts DROP CONSTRAINT "PK_5fb1bcfca1b0dca801ad8939fa6";
       public         
   saas-promo    false    222                       2606    32958 5   promo_master_discounts PK_715540b317f0edeb19af3c7a8ce 
   CONSTRAINT     u   ALTER TABLE ONLY public.promo_master_discounts
    ADD CONSTRAINT "PK_715540b317f0edeb19af3c7a8ce" PRIMARY KEY (id);
 a   ALTER TABLE ONLY public.promo_master_discounts DROP CONSTRAINT "PK_715540b317f0edeb19af3c7a8ce";
       public         
   saas-promo    false    230            �           2606    32821 <   int_reward_partners_approvals PK_764b17f6b54b8df76a153513099 
   CONSTRAINT     |   ALTER TABLE ONLY public.int_reward_partners_approvals
    ADD CONSTRAINT "PK_764b17f6b54b8df76a153513099" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.int_reward_partners_approvals DROP CONSTRAINT "PK_764b17f6b54b8df76a153513099";
       public         
   saas-promo    false    208            
           2606    32975 ?   promo_master_discounts_approvals PK_7c093771735c98b4afeaf790020 
   CONSTRAINT        ALTER TABLE ONLY public.promo_master_discounts_approvals
    ADD CONSTRAINT "PK_7c093771735c98b4afeaf790020" PRIMARY KEY (id);
 k   ALTER TABLE ONLY public.promo_master_discounts_approvals DROP CONSTRAINT "PK_7c093771735c98b4afeaf790020";
       public         
   saas-promo    false    232                       2606    32930 A   promo_discount_layering_permission PK_7ebca90cbc5ca89ab03b7383ed4 
   CONSTRAINT     �   ALTER TABLE ONLY public.promo_discount_layering_permission
    ADD CONSTRAINT "PK_7ebca90cbc5ca89ab03b7383ed4" PRIMARY KEY (id);
 m   ALTER TABLE ONLY public.promo_discount_layering_permission DROP CONSTRAINT "PK_7ebca90cbc5ca89ab03b7383ed4";
       public         
   saas-promo    false    226                       2606    33038 7   promo_products_approvals PK_9b8df5aa9ce8d58d3b4ac00e72e 
   CONSTRAINT     w   ALTER TABLE ONLY public.promo_products_approvals
    ADD CONSTRAINT "PK_9b8df5aa9ce8d58d3b4ac00e72e" PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.promo_products_approvals DROP CONSTRAINT "PK_9b8df5aa9ce8d58d3b4ac00e72e";
       public         
   saas-promo    false    242            �           2606    32879 @   promo_additional_voucher_discount PK_a14c7d817dddb337035b2ee1ea6 
   CONSTRAINT     �   ALTER TABLE ONLY public.promo_additional_voucher_discount
    ADD CONSTRAINT "PK_a14c7d817dddb337035b2ee1ea6" PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.promo_additional_voucher_discount DROP CONSTRAINT "PK_a14c7d817dddb337035b2ee1ea6";
       public         
   saas-promo    false    218            �           2606    32781 &   users PK_a3ffb1c0c8416b9fc6f907b7433_1 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433_1" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433_1";
       public         
   saas-promo    false    201            �           2606    32844 5   int_reward_redemptions PK_b1c57dae8d80549668b51582e98 
   CONSTRAINT     u   ALTER TABLE ONLY public.int_reward_redemptions
    ADD CONSTRAINT "PK_b1c57dae8d80549668b51582e98" PRIMARY KEY (id);
 a   ALTER TABLE ONLY public.int_reward_redemptions DROP CONSTRAINT "PK_b1c57dae8d80549668b51582e98";
       public         
   saas-promo    false    212            �           2606    32866 >   promo_page_inclusions_approvals PK_c00d685ae4ce7a8daa7988e4626 
   CONSTRAINT     ~   ALTER TABLE ONLY public.promo_page_inclusions_approvals
    ADD CONSTRAINT "PK_c00d685ae4ce7a8daa7988e4626" PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.promo_page_inclusions_approvals DROP CONSTRAINT "PK_c00d685ae4ce7a8daa7988e4626";
       public         
   saas-promo    false    216                       2606    32941 2   promo_discount_tier PK_f488239bf44e2900a782ce2cbe4 
   CONSTRAINT     r   ALTER TABLE ONLY public.promo_discount_tier
    ADD CONSTRAINT "PK_f488239bf44e2900a782ce2cbe4" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.promo_discount_tier DROP CONSTRAINT "PK_f488239bf44e2900a782ce2cbe4";
       public         
   saas-promo    false    228                       2606    33001 4   promo_pages_approvals PK_fe4b4c00f16801da9eb1f76c0d9 
   CONSTRAINT     t   ALTER TABLE ONLY public.promo_pages_approvals
    ADD CONSTRAINT "PK_fe4b4c00f16801da9eb1f76c0d9" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.promo_pages_approvals DROP CONSTRAINT "PK_fe4b4c00f16801da9eb1f76c0d9";
       public         
   saas-promo    false    236            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   .   x�3����I�10�2������,c.(˄��2�2��̹b���� E��     