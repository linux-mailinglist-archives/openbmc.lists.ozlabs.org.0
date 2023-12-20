Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 134668224ED
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:46:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=pjxFC5Zh;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=pjxFC5Zh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Sdh5LwKz3bqV
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:46:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=temperror header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=pjxFC5Zh;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector1 header.b=pjxFC5Zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:feae::70b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=radhaiezhil.murugan@hcl.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sw3404Bdzz2xYt
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 17:06:49 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qg9LdXISd+lzajMkEHdfUTtVGVfHK50YIrcg34CzP+Sl5oe398N42B5wHHjGEIJ/oiaFCx3XVe5tjg2VFjFTsmIh9Xg/g0nbUNpv9r6hp9pZvq6cSZQQPZAwULJAYHIzrGcp098emaDj3yI0qn2lJGhxv5Tn/LlWblYSotk4BJdON4uw2squhNYxwdu3q+DaCj4lFEHkizEOVEEyORHHuZMVb/xcBa17J+pHKbUbRR0ktO015v1ED2jnSTmTifFZN7aBGE3lqnTsMKKHWpNr9Q8xDFkz4QY6vhxXdM0VOgN6lRW6KkIqRXoemiQqC74Rj9ZVhOtkTBK1WXfoluUVqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnfcTCSkBLuuVOXl0js8FYo4GoGyDTyMGFEgW45kSlg=;
 b=RnCTtaK6MmKCCrsdWeEgpChjq62EOi+jChG4fPHurv59iTykAnoEj+c16ys0KzQ3mKK1YdgtWlXQscsHher9ftT1hpZe/jK9YxHg0kP+x/RhYdsWW8KL9nJz+89gF9+7p6lLeumOXuzUUZBMB5sE9HBxYBx6/LumLg3/y6nafzsRwYRgmEDJppuv+AeIWaJSkvPbqEK0cfKVLPFF+0xl3nDuWI5B3qaeu5rtRVeELoRGBg1vy7htdAgfHaHsoKngdxpG6rDY1LkBOWkVrIEyJSEcv24Io+6U+3oLr7MnJRYuHdvQTw1sKh5BwCBm1xAlI3pA5afWo48nqSXiYbLi8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.125) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=hcl.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=hcl.com;
 dkim=pass (signature was verified) header.d=hcl.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=hcl.com] dkim=[1,1,header.d=hcl.com]
 dmarc=[1,1,header.from=hcl.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnfcTCSkBLuuVOXl0js8FYo4GoGyDTyMGFEgW45kSlg=;
 b=pjxFC5ZhLIv5jFaGyKqj3LuEN5YGZZJfW9ZJinDp/nShJo0Eo0H/Pp4h6YvgtWRcAAaq41K4QjtrJczDEJo8UWlytFiU6q+xvyR4w4go2txtsKUGyXVLozwr55RNR4CjdYWEwfPVmWPBNSPc8+zHTsAFGwTOlavrRsTwj+eCq4ar5ztPJURcJNx4Eki46oMKP6nmQ9XMCqikucgYPF4A8Lm7SanUUIiW7y2MOlNlthchPyfeBIhJvc3K2vF+rE75KbZUYU4l4qgoHHmcXJBxCxBRKMeu205ycwPpIz7DiEbnWDlWcnnlP6ag7tnzrDsL6GvlCH9fzXQ7f5IlwCVeNA==
Received: from SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21) by
 PSAPR04MB4359.apcprd04.prod.outlook.com (2603:1096:301:38::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Wed, 20 Dec 2023 06:06:28 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:4:be:cafe::58) by SG3P274CA0009.outlook.office365.com
 (2603:1096:4:be::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 06:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.125)
 smtp.mailfrom=hcl.com; dkim=pass (signature was verified)
 header.d=HCL.COM;dmarc=pass action=none header.from=hcl.com;
Received-SPF: Fail (protection.outlook.com: domain of hcl.com does not
 designate 144.49.247.125 as permitted sender)
 receiver=protection.outlook.com; client-ip=144.49.247.125;
 helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.125) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 06:06:26 +0000
X-CFilter-Loop: Reflected
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxWMttycUPkl/XhJyAlgpu5sArQhunJ6SW0MW3qe3h34Kuhoxjmpd4KzxnJiTdEo6WUrqYQrT84jQlUL6IpcPvCQJZDXQ6Dh2hlul8BhgOBnB28OmuDGpTeoMeKOr4LgsqgwFm8kyG/RL9VHJgoGtJ9YJrmdfJaYMiRDKbma+9PkojC+5Y6gq8epcuExkwctZb5QKE2UBVIABRS/S5frNgl0HXEdupBU1bG8GgI9hMkSe9O7Cj2ZOtiTUnsRqpAGwhqXPxVB6levXFybhrwZpoM+HP3S8SvtdkLAxgxYoz+84OTiN+MW7O/ftmT61dinVTYqYwpQ2G9fXlBYll03QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnfcTCSkBLuuVOXl0js8FYo4GoGyDTyMGFEgW45kSlg=;
 b=THagkP7rnpWLDdTL2FFP97Pw+W5G7hwU0E/DFBGLRVCmBTDLCDtjLpeyW7onmSBM/aFMCeInrQAARG8n0hvNzWwAOPjjdn9Y8etgDJIHtUFHGyylSJQte3BBJG+7e+pAep1XZie/zOkq19eTnz+sDQRT7cNMGp7fxx/7jpWwamzJLIw1jlRhtLBzfagvTWfXhUE1ReyxVrm7Vz2xBCYRfVqSUpaqAWnFi5fdjWB7cBZfNvdMyTu1PlGDwukffbSEPnfGbbUuIQVGOey6/NUQHw4UfOlVrTEbZfU0QP2HLoVuK6VdZLZPjQYGVYX/6a5q3g38TYZZOMx9w/ebaO6SbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnfcTCSkBLuuVOXl0js8FYo4GoGyDTyMGFEgW45kSlg=;
 b=pjxFC5ZhLIv5jFaGyKqj3LuEN5YGZZJfW9ZJinDp/nShJo0Eo0H/Pp4h6YvgtWRcAAaq41K4QjtrJczDEJo8UWlytFiU6q+xvyR4w4go2txtsKUGyXVLozwr55RNR4CjdYWEwfPVmWPBNSPc8+zHTsAFGwTOlavrRsTwj+eCq4ar5ztPJURcJNx4Eki46oMKP6nmQ9XMCqikucgYPF4A8Lm7SanUUIiW7y2MOlNlthchPyfeBIhJvc3K2vF+rE75KbZUYU4l4qgoHHmcXJBxCxBRKMeu205ycwPpIz7DiEbnWDlWcnnlP6ag7tnzrDsL6GvlCH9fzXQ7f5IlwCVeNA==
Received: from SEZPR04MB6320.apcprd04.prod.outlook.com (2603:1096:101:a7::6)
 by SEZPR04MB6574.apcprd04.prod.outlook.com (2603:1096:101:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 06:06:20 +0000
Received: from SEZPR04MB6320.apcprd04.prod.outlook.com
 ([fe80::171b:9f3:40d5:426f]) by SEZPR04MB6320.apcprd04.prod.outlook.com
 ([fe80::171b:9f3:40d5:426f%4]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 06:06:20 +0000
From: Radhai Ezhil Murugan <radhaiezhil.murugan@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: New User added ,not able to access through LAN with ipmitool lanplus
 command 
Thread-Topic: New User added ,not able to access through LAN with ipmitool
 lanplus command 
Thread-Index: AQHaMwmr/otN5j4HtUmcQbDn9Zj9Tw==
Date: Wed, 20 Dec 2023 06:06:20 +0000
Message-ID:  <SEZPR04MB6320987EB7D35EF2A314BBD0EE96A@SEZPR04MB6320.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hcl.com;
x-ms-traffictypediagnostic: 	SEZPR04MB6320:EE_|SEZPR04MB6574:EE_|HK3PEPF00000220:EE_|PSAPR04MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6c31ad-5dfe-4942-a7ff-08dc0121cd5f
X-DetectorID-Processed: 7a3ff160-c3d4-11eb-a2f1-967d7d39dbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  VEUfNvG0EBPGm/bpoTbmLP3PvgztTuqMvd3V9s0HQNeucXeeeDzh2NpKzrixyA5/si3G6HS65MFSTiNF/6AmyqmGrs0qam3dZCuHfU9n7Z3PWYlEl4WWwAZTNdv3E5DqIFxNqHS6hClU0mNnSRN7q+DcRUN3cwdoNEF6vf9sGxB4Bs7jk2L4pGnZbTRFo4ruZ40iAZHBZzPYfhqnSJgwC8KN4XmLifQnQEqkRtvYKFmG1jaETLwBXg7AX1liAqQS8JUTmMgghuubsOGL5ZCViudmedEL92IBhxa6gEybt04DE4SfE16AkooH7s0aHDNSqO1SiGxDAalmGkmc3UBRcIuLo1tIX7XG+gMDUHw68mk7df0D2hqhYdxcuQy3U+OmBE9OoqVTX5dfg5wFvIJw/apb5QwTN3RqQJsIKyESVnFh/rgtq1GeO94HVJv0Ksaiez7bdsPfI75r0zDr61S07rPPzEbx3Oh/2Vn+JCUkFTKyz7J2hWko/Xyebv3c+yru+tbK4lKICHo5reoEH0VYlSuSvuuqu6wb8ITA+76SMJ0giDIvDkKbhhOHOu+AVX/JAoqVNQS7mLRKuRAioqdz+DLMFIATEDkzV6yyyTlnGW8+7XddKBRCFnvrGiVHb8hFYABb7iz6UtGxkTMnSo8VnILj7JnzJos5czUyXIWMx2I=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB6320.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(230373577357003)(230473577357003)(1800799012)(451199024)(64100799003)(186009)(38070700009)(55016003)(19627405001)(7696005)(6506007)(71200400001)(478600001)(76116006)(8676002)(8936002)(66556008)(66446008)(66476007)(52536014)(91956017)(64756008)(2906002)(6916009)(66946007)(9686003)(316002)(4743002)(41300700001)(5660300002)(122000001)(86362001)(83380400001)(38100700002)(33656002)(82960400001);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_SEZPR04MB6320987EB7D35EF2A314BBD0EE96ASEZPR04MB6320apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6574
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	2784234f-2ecf-4199-a7db-08dc0121c993
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oOsC13xmsdrYbfMp2++cauYdpg2padDenQb7Gxo3PEfSyHQKvI+MSnyeelOMS25IR/o/4c1zGHU+XwRNQJO1rU7xulH/Zc5S/JPxCNO5hpzouCjXDViMt6KVCGVTiFKY5Wb0nXZeUNza/gBB+2eMHpXeYg4F6gkJbsm1oqUe/R8wodlxk29qnJQGlU60c5TbWhNZTB9DySDYeQUZ+RuXL4vPblYI9fUc1gLjhpNdd0WPOjm2up5LtNYxVSn5bJtp/6OKN8VE3uW4Uw4RUsOonnAH+ogKjXHqVqFvjtXvXMco7IC8e7ie9oZANOTSwn7wfz/UOTUrQpYRvWrZOsIUso7U/+uZkNPynVC0dTNUFx6CJkdYa9SEVTbPKqbVJzbNVKrbaUSWevWICdxS5opBCubJj5uKgx9wpSlahx+5zdbjxTHNkA/zNysKfUz+wVEG1CcS6EGjeUxM5zeYNvK9dJvC6FNX2ArbB2Q1LRGAQAVOW4lo0Sy53up86eH8BZthtG1YR6sxz3vWKA1QkcgbouxOe9ugNLxI0jWVGRr1TMgAHjk9zEFIJl/CMpI4K2qyPi2B4RRj+XCl7CzZNKGGvOP5RrNpb8M/sW19wnq5SSoUFYUZwJM1aDyd1zHeG1P7sb5cQcaCGL2SFa7uHAS32DOnDJnLArbylZdppRzU+J22mGBxwNx42KndY7ghmpap4xP9xeRSQaqNdAbJwZcmy3s925vEcFvs1PwcbbLBDQp5GwpzrZxXlNQSyNsNbPSgrRLMsl+zZ5ao90RE2t8A5X6xmAL4ocsjJpKb68W9tSuNDkVl4/BVsZb7clzYuuNO1o4OgrGDJmAdq3os8ITiQcA78Xc8sK+TcxF/AEbS5Lg=
X-Forefront-Antispam-Report: 	CIP:144.49.247.125;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230473577357003)(230922051799003)(230373577357003)(64100799003)(451199024)(1800799012)(186009)(82310400011)(36840700001)(46966006)(40470700004)(82740400003)(19627405001)(86362001)(82960400001)(55016003)(33656002)(356005)(81166007)(40480700001)(40460700003)(478600001)(41300700001)(70206006)(7696005)(70586007)(6916009)(336012)(26005)(9686003)(47076005)(83380400001)(6506007)(4743002)(316002)(2906002)(5660300002)(52536014)(8936002)(8676002)(36860700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 06:06:26.4977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6c31ad-5dfe-4942-a7ff-08dc0121cd5f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912;Ip=[144.49.247.125];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4359
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:46:15 +1100
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

--_000_SEZPR04MB6320987EB7D35EF2A314BBD0EE96ASEZPR04MB6320apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I have added new user with administator privilege and ipmi =3Don
D  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
1   root             false   true       true       ADMINISTRATOR
2   operator1        true    true       true       ADMINISTRATOR
3                    true    false      false      NO ACCESS
4                    true    false      false      NO ACCESS
5                    true    false      false      NO ACCESS
6                    true    false      false      NO ACCESS
7                    true    false      false      NO ACCESS
8                    true    false      false      NO ACCESS
9                    true    false      false      NO ACCESS
10                   true    false      false      NO ACCESS
11                   true    false      false      NO ACCESS
12                   true    false      false      NO ACCESS
13                   true    false      false      NO ACCESS
14                   true    false      false      NO ACCESS
15                   true    false      false      NO ACCESS

and acess level for both root user and LAN user are same

radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H 192.168.1.211 -I lanplus -=
U root -P 0penBmc  channel getaccess 1 2
Maximum User IDs     : 15
Enabled User IDs     : 2

User ID              : 2
User Name            : operator1
Fixed Name           : No
Access Available     : call-in / callback
Link Authentication  : enabled
IPMI Messaging       : enabled
Privilege Level      : ADMINISTRATOR
Enable Status        : enabled
radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H 192.168.1.211 -I lanplus -=
U root -P 0penBmc  channel getaccess 1 1
Maximum User IDs     : 15
Enabled User IDs     : 2

User ID              : 1
User Name            : root
Fixed Name           : No
Access Available     : callback
Link Authentication  : enabled
IPMI Messaging       : enabled
Privilege Level      : ADMINISTRATOR
Enable Status        : enabled

but new user not able to establish connection with ipmitool lanplus command

radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H 192.168.1.211 -I lanplus -=
U operator1 -P password1234 power status
Error: Unable to establish IPMI v2 / RMCP+ session


I need establish LAN access for new user

Please advise

Thank you ,
Radhai
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

--_000_SEZPR04MB6320987EB7D35EF2A314BBD0EE96ASEZPR04MB6320apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have added new user with administator privilege and ipmi =3Don</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">D &nbsp;Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; Callin &nbsp;Link Auth &nbsp;IPMI Msg &nbsp; Channel Priv Limit</spa=
n></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">1 &nbsp; root &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; false &nbsp; true=
 &nbsp; &nbsp; &nbsp; true &nbsp; &nbsp; &nbsp; ADMINISTRATOR</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">2 &nbsp; operator1 &nbsp; &nbsp; &nbsp; &nbsp;true &nbsp; &nbsp;true &nbs=
p; &nbsp; &nbsp; true &nbsp; &nbsp; &nbsp; ADMINISTRATOR</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">7 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">9 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tr=
ue &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCE=
SS</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">10 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; true &n=
bsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCESS</s=
pan></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">11 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; true &n=
bsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;NO ACCESS</s=
pan></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">12 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; true &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; =
&nbsp; &nbsp;NO ACCESS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">13 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; true &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; =
&nbsp; &nbsp;NO ACCESS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp;&nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">14 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; true &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; =
&nbsp; &nbsp;NO ACCESS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
 &nbsp; &nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">15 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; true &nbsp; &nbsp;false &nbsp; &nbsp; &nbsp;false &nbsp; =
&nbsp; &nbsp;NO ACCESS &nbsp;</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">and acess level for both root user and LAN user =
are same</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H=
 192.168.1.211 -I lanplus -U root -P
 0penBmc &nbsp;channel getaccess 1 2</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Maximum User IDs &nbsp; &nbsp; : 15</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Enabled User IDs &nbsp; &nbsp; : 2</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">User ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 2</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">User Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: operator1</span></di=
v>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Fixed Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : No</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Access Available &nbsp; &nbsp; : call-in / callback</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Link Authentication &nbsp;: enabled</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">IPMI Messaging &nbsp; &nbsp; &nbsp; : enabled</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Privilege Level &nbsp; &nbsp; &nbsp;: ADMINISTRATOR</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Enable Status &nbsp; &nbsp; &nbsp; &nbsp;: enabled</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H 192.168.1.211 -I lanplus=
 -U root -P 0penBmc &nbsp;channel getaccess
 1 1</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Maximum User IDs &nbsp; &nbsp; : 15</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Enabled User IDs &nbsp; &nbsp; : 2</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">User ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 1</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">User Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: root</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Fixed Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : No</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Access Available &nbsp; &nbsp; : callback</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Link Authentication &nbsp;: enabled</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">IPMI Messaging &nbsp; &nbsp; &nbsp; : enabled</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">Privilege Level &nbsp; &nbsp; &nbsp;: ADMINISTRATOR</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Enable Status &nbsp; &nbsp; &nbsp; &nbsp;: enabl=
ed</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">but new user not able to establish connection wi=
th ipmitool lanplus command</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">radhai@radhai-ThinkPad-T495:~$ ipmitool -C 17 -H=
 192.168.1.211 -I lanplus -U operator1
 -P password1234 power status</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Error: Unable to establish IPMI v2 / RMCP+ sessi=
on</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">I need establish LAN access for new user</span><=
/div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Please advise</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Thank you ,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Radhai</span></div>
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

--_000_SEZPR04MB6320987EB7D35EF2A314BBD0EE96ASEZPR04MB6320apcp_--
