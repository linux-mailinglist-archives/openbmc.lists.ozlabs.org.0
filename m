Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D312E284C
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 18:12:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1xTw49NJzDqP0
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 04:12:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.98; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=manikandan.e@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=XT3ZkdQh; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=XT3ZkdQh; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300098.outbound.protection.outlook.com [40.107.130.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1xTG410PzDqMH
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 04:12:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPLaiFhj/I8Y5pWfPvIlGnKszCVPQYU5HEc2iSIZFs4=;
 b=XT3ZkdQh2nkLct3M36hR7nz2W5PC6orEt3O3wOIzXWW8aiqDtStecuZri50jxs24Rycr4uuUT93vmnmGX/QBKEd9Sz2F+pK3AId5wzyUol3mkWg9enNmgwbYqnln8qGeKLJ11H6BArIDVfSTvdHc9N9DHNy2osF5fIltrAHxpOA=
Received: from SG2PR03CA0139.apcprd03.prod.outlook.com (2603:1096:4:c8::12) by
 TY2PR04MB3247.apcprd04.prod.outlook.com (2603:1096:404:a0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29; Thu, 24 Dec 2020 17:12:08 +0000
Received: from SG2APC01FT053.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c8:cafe::1) by SG2PR03CA0139.outlook.office365.com
 (2603:1096:4:c8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.13 via Frontend
 Transport; Thu, 24 Dec 2020 17:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=JPN01-OS2-obe.outbound.protection.outlook.com;
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (192.8.195.59) by
 SG2APC01FT053.mail.protection.outlook.com (10.152.250.240) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Thu, 24 Dec 2020 17:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9VGnrmP38unEZ1MBTbfB5yhukZLVMxEL5G0vFqiv+qC2gu60SNmk/2EOfUPzhCm/gyR/41OyawFhpwhb74vknCE/+14GHl+J1irPVFAyXVc5rtgUrh3BTTD18KT6P4ATmko7FihH/YhjV6pxFDZx9/FHrNkqP3Ymwakx0WNDTI/QXIHldgLyNcXq7T4/7oA8Y3n9Wh432uxw7vUCGlfPPiz9wv3Cdzj9DcJVkywsPVPT77k6Ru4KY8nBquLBARhrOUXay8rOZVDQtFpN/9F5GbxTO18v2w31g3iLLYlPw+U8yLQnvAXkYDdgW9SbYhPH4o2RUIW8Pu32avIoAGuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPLaiFhj/I8Y5pWfPvIlGnKszCVPQYU5HEc2iSIZFs4=;
 b=bAp/WGTFvAP3bfZVweyRmAuGC4kR+Cm9IfGyUpyBxS1913aqE10kRiR6cWrsfnXGLaEmqs2+QYYYspKhx/EwKBQRxmRjjDSXgDHO1sAv5QDAtnek9WYeC+NpETDXRmwHkjDNuU+zdzFg2pDhW78kmcEsR/tef1y04DBU/LvBmY4XkMJsiuAiBXLR9px8O11jypxlItwu7sFxGEfF7v8zqu3wFh1+0nWw8PeWEBlvUW3pGSdiMxhEtF7oJg9kfuDaDHYmzd/za488Rr7VUKLuMGhxEvDER8DXe10IqsjWfBeoDaVNFtr+zBN/ZWQAvsH1V1X+WWmC5iuyUSRJvKuKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPLaiFhj/I8Y5pWfPvIlGnKszCVPQYU5HEc2iSIZFs4=;
 b=XT3ZkdQh2nkLct3M36hR7nz2W5PC6orEt3O3wOIzXWW8aiqDtStecuZri50jxs24Rycr4uuUT93vmnmGX/QBKEd9Sz2F+pK3AId5wzyUol3mkWg9enNmgwbYqnln8qGeKLJ11H6BArIDVfSTvdHc9N9DHNy2osF5fIltrAHxpOA=
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com (2603:1096:404:a4::20)
 by TYAPR04MB2301.apcprd04.prod.outlook.com (2603:1096:404:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 17:12:04 +0000
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::549a:67e4:847e:45d6]) by TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::549a:67e4:847e:45d6%6]) with mapi id 15.20.3676.029; Thu, 24 Dec 2020
 17:12:04 +0000
From: Manikandan E <manikandan.e@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 64, Issue 61
Thread-Topic: openbmc Digest, Vol 64, Issue 61
Thread-Index: AQHW2gxKSTNtsrli3kWCgplafS6JsaoGeZbvgAAB094=
Date: Thu, 24 Dec 2020 17:12:04 +0000
Message-ID: <TY2PR04MB3038FED190728BEAE373C1349DDD0@TY2PR04MB3038.apcprd04.prod.outlook.com>
References: <mailman.885.1608824855.21947.openbmc@lists.ozlabs.org>,
 <TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0@TY2PR04MB3038.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0@TY2PR04MB3038.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [112.133.236.35]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7562d78c-9258-4334-457e-08d8a82f0b4f
x-ms-traffictypediagnostic: TYAPR04MB2301:|TY2PR04MB3247:
X-Microsoft-Antispam-PRVS: <TY2PR04MB3247F62F31423425ED62261B9DDD0@TY2PR04MB3247.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: i8wY7pApLwokqEBq3Pb98r3Nv5ZnEYEsrYMQyNhviP46b9VECzKsXPecToM0ysvERvjS3EDqTu+yO3IoOW7W0lvk7+K5crILsHzo+IsoDhdH+L6EJJ0o4WK557x8HFb2BedE/Hw4xgIkHoUfnFiqLrsr1KUR/UXDG1S3r75T6KQw3+mbqoOsZfM0OaUae6eOpZ0N27ps9V61v+l4OVhbEw5TzjicyzYd/8HruWzUImTslyCZowUV2DLDMnL87TkBpFRpSIemCx/9bz6XdzFkCNs1f08GHAyRIO01mCRU/Rn6+SFgjbQvjD1ERB16z6gh0KHazXXXzsMdbQrcmOJfLeyE8u1EpR/BADiX9SpHdYGAYfMJO5yT08CGjPM1aeru0gqQXMLoosj5hqX1+NXElNPY5qSsZAHXgaLx7PZvhtEJBamefG3BqSZqw8fTGwKMymzBGNlGPdzSEdn3ogCRUA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3038.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(55016002)(2940100002)(166002)(8936002)(52536014)(5660300002)(83380400001)(19627405001)(86362001)(33656002)(45080400002)(6916009)(8676002)(71200400001)(478600001)(7696005)(30864003)(966005)(91956017)(316002)(66446008)(9686003)(64756008)(6506007)(66556008)(53546011)(76116006)(186003)(26005)(2906002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?qIVNFI11mWQDF3YHMcpVpPXy34xlcWBwM06qOKO7R3PO1VQhBq3WjbDg?=
 =?Windows-1252?Q?vopsvfvdFl5k/Hl8+GWCd7ejIO1bPx7XYjlG4KyQOEe47M8iSoFt48Sn?=
 =?Windows-1252?Q?3TkZ2fjaB1DY8Wd8/LmQ2xJl00PT2LTGPKxRL40xQTNGRbvd4Aw5XDDb?=
 =?Windows-1252?Q?HDD0i1VusjtE2zXShvhvGOvsZx3GPeNCiAValfvnKWndenb3F8gZfjsl?=
 =?Windows-1252?Q?8TVTrR3CtP4nGYg8rtS8EA3kwuxkdEDAKRsb/sBcq7bi+OocGEbj+XoF?=
 =?Windows-1252?Q?b2mgKJHk8+8kfayVAazabQT6z8iN1NbOaST3UL96x7x5oZbfBkg/1lY/?=
 =?Windows-1252?Q?EqtAaBiI6mPjmtTUpRhwQDy4s4jlOR0b0EwUsEYplk8dE/UciKQl45gF?=
 =?Windows-1252?Q?Uc3aUM5xWm/DNg7H/6267NR2WDWfGRz4el5nymwVBFf6ZGeE0WCqeBZt?=
 =?Windows-1252?Q?Msx9ZTsPjxlw/OCY4MioiNqkbpHBgCrX0I0osTnxCM0Y/msxYI2xXZnI?=
 =?Windows-1252?Q?62lJgN5bC+tfBX16UYM9VP3F2gauFhBLLbDqZV+3dcB4mJ9nMscUxrGU?=
 =?Windows-1252?Q?yuvH+7vBJPLyJXXUsTGEAFgBSIh4L9EQZALDiGUtzgjetU9eqIvaS6Pg?=
 =?Windows-1252?Q?IV/GcmsUtxVgqTiPKdr2TwpNqFja5r7RwY9OWYq4vnbJhxpTUqER/zTg?=
 =?Windows-1252?Q?90wXqlWa3Xd8EERNFsVCo7Il1eiQgsdYMK8pMCAXMR9QXYCbNvMsPpOR?=
 =?Windows-1252?Q?KS+2aEdg04GkHR4Kay6NUMNyN7fMXANZWR+SkJ0YbMLqV6KrMQoAvGw+?=
 =?Windows-1252?Q?sIpB0CYodyshw3IlC/M13kdUkmkLsnZzgNmN4iMtT6KVj/U90Bs5y4Td?=
 =?Windows-1252?Q?dzzsrYfVPdvkgaYglzKHjjBeiUo8/qKzIMBjjuLvTfQw8fj4IKSKQXbo?=
 =?Windows-1252?Q?L8Zw8f9hDlAW+VbU+5i77+Hr2uEnXgjRTmAFx1OWfGoxqaZ5RobFlf4s?=
 =?Windows-1252?Q?49i/rTo3Gngsusnr4OsXRR9uDSUFGVysu9jcOXeAhVrzZviNdMo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3038FED190728BEAE373C1349DDD0TY2PR04MB3038apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2301
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c28d724-aa7f-474f-a1e8-08d8a82f094d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uomcf5l1nMAgiVIRa3PY0ErDfVJFfbxOXcxc6GxodfFWOQXSmKncb27ZJ1ckBni7cyI35lKfzlRxvJHKacCiinBnDqK0g+/M8VLguxMAFPsiS5AWUEOotIvn66w8Fb26qsmdwWiRrCq5rUqxylN04qrT46LusXpuSxezweT93tRqVhbgOjAEX70vjwBIXqnnYsrd3G9eQQ8jtCoxi2zSF1poCG2bJLlRoS4RCsqM+s820h7UYgvT5FJpezNo77iB7/nIH6b7fyS+r1nWqjEvEVoCKvgEfZRk6/M8weCig6qEcKCjysBwULQcXTLGkTUBfOazt7MIzmNfCucoPXuMliM6Km1ktEHuDfPKBi4lykhQ42t2W/GiScjTOgx5codOYy7cW+KQweIMdwlSxuEEkgGDuLGU2gbyOFv4sb9CbAqPYZ8bdhY6UzNrDw2dPOEDnBGcFzNjxWtgJuDQkTNVFCdDGLvGr474LC8Q3T1yF54AomRTr2IwcWn5gMCfYO95yleVKh0kRAVOi0SnHXF6b2P09GWSOPCERydvIJnqEUQi0h9Vcopmf/W/VvQ/PDbS
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JPN01-OS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966006)(55016002)(316002)(2906002)(7696005)(70586007)(70206006)(30864003)(478600001)(47076005)(45080400002)(86362001)(2940100002)(356005)(336012)(8936002)(26005)(6506007)(9686003)(83380400001)(966005)(33656002)(166002)(36906005)(82310400003)(52536014)(19627405001)(82740400003)(19627235002)(81166007)(186003)(5660300002)(8676002)(34020700004)(6916009)(53546011)(579004);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 17:12:07.2321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7562d78c-9258-4334-457e-08d8a82f0b4f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[JPN01-OS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3247
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB3038FED190728BEAE373C1349DDD0TY2PR04MB3038apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi All,


   Please ignore my previous mail.


Thanks
Mani.E
________________________________
From: Manikandan E <manikandan.e@hcl.com>
Sent: 24 December 2020 22:37
To: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 64, Issue 61

Dear Kotes,

I am not able to change RM in ESS as attached snap issue and raised SSD  .

Will update RM after issue is fixed.


Thanks
Mani.E
________________________________
From: openbmc <openbmc-bounces+manikandan.e=3Dhcl.com@lists.ozlabs.org> on =
behalf of openbmc-request@lists.ozlabs.org <openbmc-request@lists.ozlabs.or=
g>
Sent: 24 December 2020 21:17
To: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: openbmc Digest, Vol 64, Issue 61

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Send openbmc mailing list submissions to
        openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.ozlabs.org%2Flistinfo%2Fopenbmc&amp;data=3D04%7C01%7Cmanikandan.e%40=
hcl.com%7Cf3a0dcdc61be45d37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca99419=
12%7C0%7C0%7C637444217385303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DVvMdH6Qw=
pLbItcdbbVrEDYfPPCG2OGBBxCC%2FqAb57F8%3D&amp;reserved=3D0
or, via email, send a message with subject or body 'help' to
        openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
        openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of openbmc digest..."


Today's Topics:

   1. Re: create meta-ampere folder in openbmc repo (Thang Q. Nguyen)
   2. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
      Nonfunctional. (Lei Yu)
   3. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
      Nonfunctional. (Thu Nguyen)
   4. peci-pcie CI issues (Andrei Kartashev)


----------------------------------------------------------------------

Message: 1
Date: Thu, 24 Dec 2020 08:46:47 +0700
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
        <openbmc@lists.ozlabs.org>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID:
        <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

Hi Brad,

Can you help create the meta-ampere folder inside the openbmc repository?


Best Regards,

Thang Q. Nguyen -

On 12/16/20 16:54, Thang Q. Nguyen wrote:
> Hi Brad,
>
> Please help add meta-ampere repository into openbmc as a subtree.
> The meta-ampere repository has been populated with basic bring up code.
>
> Thanks,
> Thang Q. Nguyen
>


------------------------------

Message: 2
Date: Thu, 24 Dec 2020 09:52:29 +0800
From: Lei Yu <yulei.sh@bytedance.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
        Nonfunctional.
Message-ID:
        <CAGm54UEr=3DjX1jHFYG37BthZ0YoVeqcAtk3NrrFXf=3Dki7Vfzm5A@mail.gmail=
.com>
Content-Type: text/plain; charset=3D"UTF-8"

On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
<thu@amperemail.onmicrosoft.com> wrote:
>
> On 12/16/20 14:33, Thu Nguyen wrote:
> > Hi All,
> >
> >
> > I'm working with Fan sensors on Ampere MtJade platform.
> >
> > In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
> > FAN4_1, FAN4_2, FAN5_1...
> >
> > I added the configuration for those fans in phosphor-hwmon and I also
> > added option "--enable-update-functional-on-fail" in phosphor-hwmon
> > build flag. I'm trying to set fan functional to false when unplug fan.
> >
> > Flash new image to the board, read functional of fans. The time to
> > read dbus property is about 0.05->0.1 seconds:
> >
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m0.078s
> > user    0m0.002s
> > sys    0m0.032s
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> >
> > real    0m0.044s
> > user    0m0.001s
> > sys    0m0.034s
> >
> > After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
> > is set to false as expected. And functional of others fans keeps
> > true. But the time to get dbus properties of all fans have a huge
> > increasement event in the working fans.
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b false
> >
> > real    0m1.189s
> > user    0m0.001s
> > sys    0m0.036s
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m3.285s
> > user    0m0.010s
> > sys    0m0.028s
> >
> > The "ipmitool sdr type 0x4" commands is also failed because this
> > increasement.
> >
> > ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
> > type 0x4
> > FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
> > FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
> > FAN4_1           | 2Bh | ns  | 29.19 | No Reading
> > FAN4_2           | 2Eh | ns  | 29.22 | No Reading
> > FAN5_1           | 31h | ns  | 29.25 | No Reading
> > FAN5_2           | 34h | ns  | 29.28 | No Reading
> > FAN6_1           | 37h | ns  | 29.31 | No Reading
> > FAN6_2           | 3Ah | ns  | 29.34 | No Reading
> > FAN7_1           | 3Dh | ns  | 29.37 | No Reading
> > FAN7_2           | 40h | ns  | 29.40 | No Reading
> > FAN8_1           | 43h | ns  | 29.43 | No Reading
> > FAN8_2           | 46h | ns  | 29.46 | No Reading
> > PSU0_fan1        | F5h | ns  | 29.60 | No Reading
> > PSU1_fan1        | F6h | ns  | 29.61 | No Reading
> >
> > real    2m43.704s
> > user    0m0.046s
> > sys    0m0.057s
> >
> > The cause of this increasement is when it failed to read one sensor
> > phosphor-hwmon keep trying to read the sensors with the retry is 10
> > and the 100ms delays between retry times.
> >
> > Should we reduce the retry for non-functional sensors?

When a fan is unplugged, its "Present" property should be false as well.
Maybe you could check that property and skip such fans?

> >
> >
> > Regards.
> >
> > Thu Nguyen
> Hi All,
>
> Any feed back on this?
>
> Thu Nguyen,
>


--
BRs,
Lei YU


------------------------------

Message: 3
Date: Thu, 24 Dec 2020 09:32:14 +0700
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
To: Lei Yu <yulei.sh@bytedance.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
        Nonfunctional.
Message-ID:
        <2c526c72-bcad-4751-d18b-3b07ffd12964@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 12/24/20 08:52, Lei Yu wrote:
> On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
> <thu@amperemail.onmicrosoft.com> wrote:
>> On 12/16/20 14:33, Thu Nguyen wrote:
>>> Hi All,
>>>
>>>
>>> I'm working with Fan sensors on Ampere MtJade platform.
>>>
>>> In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
>>> FAN4_1, FAN4_2, FAN5_1...
>>>
>>> I added the configuration for those fans in phosphor-hwmon and I also
>>> added option "--enable-update-functional-on-fail" in phosphor-hwmon
>>> build flag. I'm trying to set fan functional to false when unplug fan.
>>>
>>> Flash new image to the board, read functional of fans. The time to
>>> read dbus property is about 0.05->0.1 seconds:
>>>
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m0.078s
>>> user    0m0.002s
>>> sys    0m0.032s
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>>
>>> real    0m0.044s
>>> user    0m0.001s
>>> sys    0m0.034s
>>>
>>> After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
>>> is set to false as expected. And functional of others fans keeps
>>> true. But the time to get dbus properties of all fans have a huge
>>> increasement event in the working fans.
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b false
>>>
>>> real    0m1.189s
>>> user    0m0.001s
>>> sys    0m0.036s
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m3.285s
>>> user    0m0.010s
>>> sys    0m0.028s
>>>
>>> The "ipmitool sdr type 0x4" commands is also failed because this
>>> increasement.
>>>
>>> ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
>>> type 0x4
>>> FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
>>> FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
>>> FAN4_1           | 2Bh | ns  | 29.19 | No Reading
>>> FAN4_2           | 2Eh | ns  | 29.22 | No Reading
>>> FAN5_1           | 31h | ns  | 29.25 | No Reading
>>> FAN5_2           | 34h | ns  | 29.28 | No Reading
>>> FAN6_1           | 37h | ns  | 29.31 | No Reading
>>> FAN6_2           | 3Ah | ns  | 29.34 | No Reading
>>> FAN7_1           | 3Dh | ns  | 29.37 | No Reading
>>> FAN7_2           | 40h | ns  | 29.40 | No Reading
>>> FAN8_1           | 43h | ns  | 29.43 | No Reading
>>> FAN8_2           | 46h | ns  | 29.46 | No Reading
>>> PSU0_fan1        | F5h | ns  | 29.60 | No Reading
>>> PSU1_fan1        | F6h | ns  | 29.61 | No Reading
>>>
>>> real    2m43.704s
>>> user    0m0.046s
>>> sys    0m0.057s
>>>
>>> The cause of this increasement is when it failed to read one sensor
>>> phosphor-hwmon keep trying to read the sensors with the retry is 10
>>> and the 100ms delays between retry times.
>>>
>>> Should we reduce the retry for non-functional sensors?
> When a fan is unplugged, its "Present" property should be false as well.
> Maybe you could check that property and skip such fans?
>
In the sensor Dbus object, we don't have the present property. The
present property is belong to the inventory object of the phosphor-fan.

If using present properties, we have to map the fan sensor name with the
corresponding inventory object. We will break the generic character of
phosphor-hwmon.

As my opinion, for hotplug supporting devices such as fans, we should
not retry when failed to read. Because there are no difference between
the fan sensors are failed to read or the fan sensors are unplugged with
the fan.

Is it reasonable to retry to read the failed sensors after each 0.1
seconds?

>>>
>>> Regards.
>>>
>>> Thu Nguyen
>> Hi All,
>>
>> Any feed back on this?
>>
>> Thu Nguyen,
>>
>



------------------------------

Message: 4
Date: Thu, 24 Dec 2020 18:47:23 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: jason.m.bills <jason.m.bills@linux.intel.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: peci-pcie CI issues
Message-ID: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
Content-Type: text/plain; charset=3D"UTF-8"

Hello Jason,

I push several patches to peci-pcie repo, but looks like CI broken
there. Could you take a look on how to fix CI?

[ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o
In file included from /usr/local/include/boost/asio/execution.hpp:19,
                 from /usr/local/include/boost/asio/system_executor.hpp:20,
                 from /usr/local/include/boost/asio/associated_executor.hpp=
:22,
                 from /usr/local/include/boost/asio/detail/bind_handler.hpp=
:20,
                 from /usr/local/include/boost/asio/detail/wrapped_handler.=
hpp:18,
                 from /usr/local/include/boost/asio/io_context.hpp:23,
                 from /usr/local/include/boost/asio/io_service.hpp:18,
                 from /home/jenkins-op/workspace/ci-repository/openbmc/peci=
-pcie/src/peci_pcie.cpp:22:
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info& boost::asio::execution::detail::an=
y_executor_base::target_type_void()???:
/usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: can=
not use ???typeid??? with ???-fno-rtti???
  811 |     return typeid(void);
      |                       ^
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info& boost::asio::execution::detail::an=
y_executor_base::target_type_ex()???:
/usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: can=
not use ???typeid??? with ???-fno-rtti???
  851 |     return typeid(Ex);
      |                     ^

--
Best regards,
Andrei Kartashev




End of openbmc Digest, Vol 64, Issue 61
***************************************
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_TY2PR04MB3038FED190728BEAE373C1349DDD0TY2PR04MB3038apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp; Please ignore my previous mail.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mani.E<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Manikandan E &lt;mani=
kandan.e@hcl.com&gt;<br>
<b>Sent:</b> 24 December 2020 22:37<br>
<b>To:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: openbmc Digest, Vol 64, Issue 61</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Dear Kotes,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I am not able to change RM in ESS as attached snap issue and raised SSD&nbs=
p; .</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Will update RM after issue is fixed.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Mani.E<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> openbmc &lt;openbmc=
-bounces+manikandan.e=3Dhcl.com@lists.ozlabs.org&gt; on behalf of openbmc-r=
equest@lists.ozlabs.org &lt;openbmc-request@lists.ozlabs.org&gt;<br>
<b>Sent:</b> 24 December 2020 21:17<br>
<b>To:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> openbmc Digest, Vol 64, Issue 61</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">[CAUTION: This Email is from outside the Organiz=
ation. Unless you trust the sender, Don=92t click links or open attachments=
 as it may be a Phishing email, which can steal your Information and compro=
mise your Computer.]<br>
<br>
Send openbmc mailing list submissions to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc@lists.ozlabs.org<br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.ozlabs.org%2Flistinfo%=
2Fopenbmc&amp;amp;data=3D04%7C01%7Cmanikandan.e%40hcl.com%7Cf3a0dcdc61be45d=
37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637444217385=
303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVvMdH6QwpLbItcdbbVrEDYfPPCG2O=
GBBxCC%2FqAb57F8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
zlabs.org%2Flistinfo%2Fopenbmc&amp;amp;data=3D04%7C01%7Cmanikandan.e%40hcl.=
com%7Cf3a0dcdc61be45d37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca9941912%7=
C0%7C0%7C637444217385303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVvMdH6Qw=
pLbItcdbbVrEDYfPPCG2OGBBxCC%2FqAb57F8%3D&amp;amp;reserved=3D0</a><br>
or, via email, send a message with subject or body 'help' to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc-request@lists.ozlabs.org=
<br>
<br>
You can reach the person managing the list at<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc-owner@lists.ozlabs.org<b=
r>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of openbmc digest...&quot;<br>
<br>
<br>
Today's Topics:<br>
<br>
&nbsp;&nbsp; 1. Re: create meta-ampere folder in openbmc repo (Thang Q. Ngu=
yen)<br>
&nbsp;&nbsp; 2. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional. (Lei Yu)<br>
&nbsp;&nbsp; 3. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional. (Thu Nguyen)<br>
&nbsp;&nbsp; 4. peci-pcie CI issues (Andrei Kartashev)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Thu, 24 Dec 2020 08:46:47 +0700<br>
From: &quot;Thang Q. Nguyen&quot; &lt;thang@os.amperecomputing.com&gt;<br>
To: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;, OpenBMC Maillist<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;openbmc@lists.ozlabs.org&gt;=
<br>
Subject: Re: create meta-ampere folder in openbmc repo<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;0e2507bc-f8c5-85c4-cd39-4c60=
3a729f4c@os.amperecomputing.com&gt;<br>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed<br>
<br>
Hi Brad,<br>
<br>
Can you help create the meta-ampere folder inside the openbmc repository?<b=
r>
<br>
<br>
Best Regards,<br>
<br>
Thang Q. Nguyen -<br>
<br>
On 12/16/20 16:54, Thang Q. Nguyen wrote:<br>
&gt; Hi Brad,<br>
&gt;<br>
&gt; Please help add meta-ampere repository into openbmc as a subtree.<br>
&gt; The meta-ampere repository has been populated with basic bring up code=
.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Thang Q. Nguyen<br>
&gt;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Thu, 24 Dec 2020 09:52:29 +0800<br>
From: Lei Yu &lt;yulei.sh@bytedance.com&gt;<br>
To: Thu Nguyen &lt;thu@amperemail.onmicrosoft.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional.<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;CAGm54UEr=3DjX1jHFYG37BthZ0Y=
oVeqcAtk3NrrFXf=3Dki7Vfzm5A@mail.gmail.com&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen<br>
&lt;thu@amperemail.onmicrosoft.com&gt; wrote:<br>
&gt;<br>
&gt; On 12/16/20 14:33, Thu Nguyen wrote:<br>
&gt; &gt; Hi All,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I'm working with Fan sensors on Ampere MtJade platform.<br>
&gt; &gt;<br>
&gt; &gt; In this platform, I have multiple fans which name as FAN3_1, FAN3=
_2,<br>
&gt; &gt; FAN4_1, FAN4_2, FAN5_1...<br>
&gt; &gt;<br>
&gt; &gt; I added the configuration for those fans in phosphor-hwmon and I =
also<br>
&gt; &gt; added option &quot;--enable-update-functional-on-fail&quot; in ph=
osphor-hwmon<br>
&gt; &gt; build flag. I'm trying to set fan functional to false when unplug=
 fan.<br>
&gt; &gt;<br>
&gt; &gt; Flash new image to the board, read functional of fans. The time t=
o<br>
&gt; &gt; read dbus property is about 0.05-&gt;0.1 seconds:<br>
&gt; &gt;<br>
&gt; &gt; root@mtjade:~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m0.078s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.002s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.032s<br>
&gt; &gt; root@mtjade:~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m0.044s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.034s<br>
&gt; &gt;<br>
&gt; &gt; After unplug one fan (FAN4_2), I can see that fan functional of F=
AN4_2<br>
&gt; &gt; is set to false as expected. And functional of others fans keeps<=
br>
&gt; &gt; true. But the time to get dbus properties of all fans have a huge=
<br>
&gt; &gt; increasement event in the working fans.<br>
&gt; &gt;<br>
&gt; &gt; ~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b false<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m1.189s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.036s<br>
&gt; &gt;<br>
&gt; &gt; ~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m3.285s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.010s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.028s<br>
&gt; &gt;<br>
&gt; &gt; The &quot;ipmitool sdr type 0x4&quot; commands is also failed bec=
ause this<br>
&gt; &gt; increasement.<br>
&gt; &gt;<br>
&gt; &gt; ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H &lt;BMCIP=
&gt; sdr<br>
&gt; &gt; type 0x4<br>
&gt; &gt; FAN3_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 25h | ok&nbsp; | 29.13 | 5100 RPM<br>
&gt; &gt; FAN3_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 28h | ok&nbsp; | 29.16 | 4700 RPM<br>
&gt; &gt; FAN4_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 2Bh | ns&nbsp; | 29.19 | No Reading<br>
&gt; &gt; FAN4_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 2Eh | ns&nbsp; | 29.22 | No Reading<br>
&gt; &gt; FAN5_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 31h | ns&nbsp; | 29.25 | No Reading<br>
&gt; &gt; FAN5_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 34h | ns&nbsp; | 29.28 | No Reading<br>
&gt; &gt; FAN6_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 37h | ns&nbsp; | 29.31 | No Reading<br>
&gt; &gt; FAN6_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 3Ah | ns&nbsp; | 29.34 | No Reading<br>
&gt; &gt; FAN7_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 3Dh | ns&nbsp; | 29.37 | No Reading<br>
&gt; &gt; FAN7_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 40h | ns&nbsp; | 29.40 | No Reading<br>
&gt; &gt; FAN8_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 43h | ns&nbsp; | 29.43 | No Reading<br>
&gt; &gt; FAN8_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 46h | ns&nbsp; | 29.46 | No Reading<br>
&gt; &gt; PSU0_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F5h | ns&nb=
sp; | 29.60 | No Reading<br>
&gt; &gt; PSU1_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F6h | ns&nb=
sp; | 29.61 | No Reading<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 2m43.704s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.046s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.057s<br>
&gt; &gt;<br>
&gt; &gt; The cause of this increasement is when it failed to read one sens=
or<br>
&gt; &gt; phosphor-hwmon keep trying to read the sensors with the retry is =
10<br>
&gt; &gt; and the 100ms delays between retry times.<br>
&gt; &gt;<br>
&gt; &gt; Should we reduce the retry for non-functional sensors?<br>
<br>
When a fan is unplugged, its &quot;Present&quot; property should be false a=
s well.<br>
Maybe you could check that property and skip such fans?<br>
<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards.<br>
&gt; &gt;<br>
&gt; &gt; Thu Nguyen<br>
&gt; Hi All,<br>
&gt;<br>
&gt; Any feed back on this?<br>
&gt;<br>
&gt; Thu Nguyen,<br>
&gt;<br>
<br>
<br>
--<br>
BRs,<br>
Lei YU<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Thu, 24 Dec 2020 09:32:14 +0700<br>
From: Thu Nguyen &lt;thu@amperemail.onmicrosoft.com&gt;<br>
To: Lei Yu &lt;yulei.sh@bytedance.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional.<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;2c526c72-bcad-4751-d18b-3b07=
ffd12964@amperemail.onmicrosoft.com&gt;<br>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed<br>
<br>
On 12/24/20 08:52, Lei Yu wrote:<br>
&gt; On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen<br>
&gt; &lt;thu@amperemail.onmicrosoft.com&gt; wrote:<br>
&gt;&gt; On 12/16/20 14:33, Thu Nguyen wrote:<br>
&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I'm working with Fan sensors on Ampere MtJade platform.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In this platform, I have multiple fans which name as FAN3_1, F=
AN3_2,<br>
&gt;&gt;&gt; FAN4_1, FAN4_2, FAN5_1...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I added the configuration for those fans in phosphor-hwmon and=
 I also<br>
&gt;&gt;&gt; added option &quot;--enable-update-functional-on-fail&quot; in=
 phosphor-hwmon<br>
&gt;&gt;&gt; build flag. I'm trying to set fan functional to false when unp=
lug fan.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Flash new image to the board, read functional of fans. The tim=
e to<br>
&gt;&gt;&gt; read dbus property is about 0.05-&gt;0.1 seconds:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; root@mtjade:~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m0.078s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.002s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.032s<br>
&gt;&gt;&gt; root@mtjade:~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m0.044s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.034s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; After unplug one fan (FAN4_2), I can see that fan functional o=
f FAN4_2<br>
&gt;&gt;&gt; is set to false as expected. And functional of others fans kee=
ps<br>
&gt;&gt;&gt; true. But the time to get dbus properties of all fans have a h=
uge<br>
&gt;&gt;&gt; increasement event in the working fans.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b false<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m1.189s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.036s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m3.285s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.010s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.028s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The &quot;ipmitool sdr type 0x4&quot; commands is also failed =
because this<br>
&gt;&gt;&gt; increasement.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H &lt;BM=
CIP&gt; sdr<br>
&gt;&gt;&gt; type 0x4<br>
&gt;&gt;&gt; FAN3_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 25h | ok&nbsp; | 29.13 | 5100 RPM<br>
&gt;&gt;&gt; FAN3_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 28h | ok&nbsp; | 29.16 | 4700 RPM<br>
&gt;&gt;&gt; FAN4_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 2Bh | ns&nbsp; | 29.19 | No Reading<br>
&gt;&gt;&gt; FAN4_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 2Eh | ns&nbsp; | 29.22 | No Reading<br>
&gt;&gt;&gt; FAN5_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 31h | ns&nbsp; | 29.25 | No Reading<br>
&gt;&gt;&gt; FAN5_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 34h | ns&nbsp; | 29.28 | No Reading<br>
&gt;&gt;&gt; FAN6_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 37h | ns&nbsp; | 29.31 | No Reading<br>
&gt;&gt;&gt; FAN6_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 3Ah | ns&nbsp; | 29.34 | No Reading<br>
&gt;&gt;&gt; FAN7_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 3Dh | ns&nbsp; | 29.37 | No Reading<br>
&gt;&gt;&gt; FAN7_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 40h | ns&nbsp; | 29.40 | No Reading<br>
&gt;&gt;&gt; FAN8_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 43h | ns&nbsp; | 29.43 | No Reading<br>
&gt;&gt;&gt; FAN8_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 46h | ns&nbsp; | 29.46 | No Reading<br>
&gt;&gt;&gt; PSU0_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F5h | ns=
&nbsp; | 29.60 | No Reading<br>
&gt;&gt;&gt; PSU1_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F6h | ns=
&nbsp; | 29.61 | No Reading<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 2m43.704s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.046s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.057s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The cause of this increasement is when it failed to read one s=
ensor<br>
&gt;&gt;&gt; phosphor-hwmon keep trying to read the sensors with the retry =
is 10<br>
&gt;&gt;&gt; and the 100ms delays between retry times.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should we reduce the retry for non-functional sensors?<br>
&gt; When a fan is unplugged, its &quot;Present&quot; property should be fa=
lse as well.<br>
&gt; Maybe you could check that property and skip such fans?<br>
&gt;<br>
In the sensor Dbus object, we don't have the present property. The<br>
present property is belong to the inventory object of the phosphor-fan.<br>
<br>
If using present properties, we have to map the fan sensor name with the<br=
>
corresponding inventory object. We will break the generic character of<br>
phosphor-hwmon.<br>
<br>
As my opinion, for hotplug supporting devices such as fans, we should<br>
not retry when failed to read. Because there are no difference between<br>
the fan sensors are failed to read or the fan sensors are unplugged with<br=
>
the fan.<br>
<br>
Is it reasonable to retry to read the failed sensors after each 0.1<br>
seconds?<br>
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thu Nguyen<br>
&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; Any feed back on this?<br>
&gt;&gt;<br>
&gt;&gt; Thu Nguyen,<br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Thu, 24 Dec 2020 18:47:23 +0300<br>
From: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<br>
To: jason.m.bills &lt;jason.m.bills@linux.intel.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: peci-pcie CI issues<br>
Message-ID: &lt;6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com&gt=
;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
Hello Jason,<br>
<br>
I push several patches to peci-pcie repo, but looks like CI broken<br>
there. Could you take a look on how to fix CI?<br>
<br>
[ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o<br>
In file included from /usr/local/include/boost/asio/execution.hpp:19,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/system_executor.hp=
p:20,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/associated_executo=
r.hpp:22,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/detail/bind_handle=
r.hpp:20,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/detail/wrapped_han=
dler.hpp:18,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/io_context.hpp:23,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/io_service.hpp:18,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /home/jenkins-op/workspace/ci-repository/openbmc=
/peci-pcie/src/peci_pcie.cpp:22:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info&amp; boost::asio::execution::detail=
::any_executor_base::target_type_void()???:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: can=
not use ???typeid??? with ???-fno-rtti???<br>
&nbsp; 811 |&nbsp;&nbsp;&nbsp;&nbsp; return typeid(void);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ^<br>
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info&amp; boost::asio::execution::detail=
::any_executor_base::target_type_ex()???:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: can=
not use ???typeid??? with ???-fno-rtti???<br>
&nbsp; 851 |&nbsp;&nbsp;&nbsp;&nbsp; return typeid(Ex);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ^<br>
<br>
--<br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
<br>
<br>
End of openbmc Digest, Vol 64, Issue 61<br>
***************************************<br>
</div>
</span></font></div>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_TY2PR04MB3038FED190728BEAE373C1349DDD0TY2PR04MB3038apcp_--
