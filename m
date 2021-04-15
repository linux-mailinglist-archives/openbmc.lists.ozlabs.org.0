Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1923612F1
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 21:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLqM52Ybhz3br0
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 05:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=rTtw0Qc2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.97;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=rTtw0Qc2; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310097.outbound.protection.outlook.com [40.107.131.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLqLr3Lb6z309h
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 05:35:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVdCXr69CVuaxYTTBfzMCXQN9LrdNZRFRGtqNsutwlyEtI79fMAyTqCYKeOHw+a7ychckhRaaiVSMbP63USQFmbvYk4H9CfAQ8dxnUPtXJWYH7MSekyJaJEQmi6pAjo+kzL/cK5xCVpygvxlsXndMH7AFteJaD+2JWXEstuDiYN5TpoCMKh8QwW2ie9SB+690QILRuvZx2A+nLLDEUxXP2YWuCsYON/T07gmIbYgOdY72cbVmIihd+BezpDlMNXQiGCBJaje43nFGwV6l3UqZLTAIIPw32B9HZi6HlJ0fyCgp3EwK0NLwgd1thbDTUEMRmr7hIRa0GNZaM6Q/ngasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67UBK4JKv0/EcOxnrhhOlDGUQYW9ktQ6pYzpsjRawJc=;
 b=IASLqVzq5TpYCjQfR/dIYxnsjA268FZMi4Wmvb2ytSSWePcdKnlqj1gOzKNiswQ9nQJ1TYaVmoDff5eIe2Z/sxv1ntr5Qnv1OTogU7gtrA/0vAZVGl7NEojNl4q5kxXqOEnzZCoOmnzsFrvJ6yf860E+0eP7IgGwT7FcWL4IjNitCsD48PQysekESZoRmuORsSXE01Q+Oe8Up1qU280di/89qrjaLf5yeDNh9mr31czfej3UEIUKTHhmJEaMq6YIcejnnjEJ9QPGyjy51FccWR62C3wQT+UUph75HT3tdypwD+Moel4HvOzyc/dA3EcOXiZGISAZ56pG0LWB5UfYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67UBK4JKv0/EcOxnrhhOlDGUQYW9ktQ6pYzpsjRawJc=;
 b=rTtw0Qc2gGvK4LV/Ww7L6sIC3oAIHE7rYFeNWhax6AqdcOzrNbaaZY4e9uFlWmJM7ljFj+I80v+r8EHnr43GI1AGrwc+20E5bjc9KixW4hvw2FGx6d67HS88mFGCxDG9ft99E+oMq0v+PxDzvZmMjc3Nb3m01cQmS3w4jFI2HN0=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSBPR02MB4309.apcprd02.prod.outlook.com (2603:1096:301:11::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 15 Apr
 2021 19:34:32 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cf0:75b0:2bff:8982]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cf0:75b0:2bff:8982%3]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 19:34:32 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question regarding snmp trap
Thread-Topic: Question regarding snmp trap
Thread-Index: AdcyLiOwAursNoYARQKsZTwNgEt53Q==
Date: Thu, 15 Apr 2021 19:34:31 +0000
Message-ID: <PS2PR02MB3541074F5D783E9A3CD72CB6904D9@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [2601:647:5b80:8dd0:253b:651:b33b:4579]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0afe9d3b-87a1-4ba9-4160-08d900457e6d
x-ms-traffictypediagnostic: PSBPR02MB4309:
x-microsoft-antispam-prvs: <PSBPR02MB430966E8B4F0166A04247691904D9@PSBPR02MB4309.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8PEpRJ4DZ5WitFgAAsua6odlNsNdfrNKLyCLV3l9NY6XOenGekZaq2WvwqZdUPmoCJzhH3QOJ/Roqg6rSE00Kq50vlPepgGA9IlwasxjWeuB+oIvlRcFgvQm5xZTiWeVa1dxiXDpKQGQMgrUBX5gacPGLXGg1NXkXJJlRwhBZERj6tTTlgStVXiWWQS8WU5sPsLQZp8WPy2VvRij2YHzppfHxTABZAhDtdqZaBhkSZdD4/xYE9klMzf8J8cTJahWPRfVNuapbWoNVoXZWms7CgGYz2CpcJe1gPkDxE7fPnsDPJGX2P7QvjryYETlU76aNPZkg9t8L70eTYBSg2sv5TluT53eiT+Nc4ua5u1upy5ZxRdlNzU3HqI0nG7N/6GyaLANJf+4CmuWrVaA/Xs57jfm9KmoqecTwI1Vpxni6nqwL1G2dzdpeD3WldgYewGmVqVZMqvfrfXLJUOTmHEGuMCd06BaWVIa4T1vIrvfT5NcG2i4cq3lXPZyYjBcpbtf+O+kaLum6mHi7qtMmG5nW8px2Mge9LYeGYssXhsH+LWJU2eVhtaQOHh9sG6HHVJRsJCt4FPVZjuwjEx6a2uCyzi8OdcmYfX+Qe0WpPE148=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(2906002)(55016002)(3480700007)(478600001)(9686003)(71200400001)(7696005)(8676002)(8936002)(86362001)(316002)(6506007)(76116006)(66946007)(66556008)(64756008)(66446008)(66476007)(6916009)(52536014)(558084003)(186003)(38100700002)(5660300002)(33656002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oEaIoUBf4JefsLRN5pkv5PO6nViL5gHXGhZGxWrmbYgBKyu3sk1ksU+wJ6LN?=
 =?us-ascii?Q?9vAKl9xbnf9zcoYPMVgh5PKC+8SnDGB7Jg0ahubZD4kJ5tkqdS/XZxS/kjRT?=
 =?us-ascii?Q?VtvDG1JaCRmZA3XGjIto23+nIF1K3+lxHq8WzeYVt99+81fnLUdSJIpRdhpJ?=
 =?us-ascii?Q?xkz2AZeMjeI3oVQNV0cn9PVeP9nckoZaYcmNaZF2WE9SK9cCHRKn3MLYbutJ?=
 =?us-ascii?Q?zNKLAOe438ptv+Fww9k5/cOHzWrHmswZCCi9I982uF8o2TMuOwrdbTh7Vhyz?=
 =?us-ascii?Q?FL3y1SDAXjIBZhKCaelHOKVj1E7Z9rdyyKdTeCA7eonmbIIh6uvOGu+AQrct?=
 =?us-ascii?Q?6AFdjGx6gTyIMzUAa6SAPzEEveJ1KX8t6E7e3eQk0BFwfL3UKFC0GfuuNOAM?=
 =?us-ascii?Q?jI3dVRNgSGN1TGahv+4d2L7jPzlkIt6rhcAUy1eSZzGluOOf+71f6LRvDy5b?=
 =?us-ascii?Q?3RJff9ncJxxNXyubzivry3b0ts/CIctfFwJsAd4T+V1LOTwu8QidB3JEJXQH?=
 =?us-ascii?Q?SWks2iTmbSxJtTHnZe0sc3l8MmUeeNz2m1UD9x9nSwz5LKpP1Z/4bCuJD7oq?=
 =?us-ascii?Q?PDvIFjPOuH88ckrIPQLM8xOofGuFBZ93FmL2N79fs7fZumB3ni4xMeGsxGbu?=
 =?us-ascii?Q?M37KQMZd2HvFEfrTkFo3+xHAuQesOY0+Fn5UZ8DPj+rpYRkIexXWdHWaUpRq?=
 =?us-ascii?Q?miYZdNOELbGvdTqkKHjDIKF16OeKATYwIvVxw4LefL/q7lZe4whGNmfEhKp1?=
 =?us-ascii?Q?1ZRnJ9LQibsLeQj5hQ1L/6OLeHYMjOaOIg2cEzPC5CKE+GGQuGqMaPoY+B6J?=
 =?us-ascii?Q?xWBRDHwEJY0so9nS49BDAjf8ADHF1ht82yKeQ4Gwoozx97SgnEaYopU8KsYJ?=
 =?us-ascii?Q?UMaQQwkHtx0l86JBtccoPiR3XZLs1o3b4Yoj6yBuZKcuU1HBD9r//BdgpiLY?=
 =?us-ascii?Q?ByKfJpaMYoruXFS3CvcJ8mCsy4HfrfHFwxjCEe1jO9+soLk76CZu2sqldSYA?=
 =?us-ascii?Q?hBeVRLxby65bqYSudChX359UKOwUOdwexGomFIA0UXUp4Ft6aOXA/R3Y/eob?=
 =?us-ascii?Q?ZkkNdn5Awixd1BiVmQ1izorxuNPXtxrFeHoiycZAYLvpSAqzpkL4d6cLvPLd?=
 =?us-ascii?Q?Gaq5diFXe2TgS/w9cxgjXrYvxsQkwpA/HY1gwidBxEo+x431FNbNrSwI+rTM?=
 =?us-ascii?Q?EBGi5PA7HJkwQzXuwNf7IuJv3u0K6MP0hxo52d06iQwHv5Cykq0I2CXpGb3b?=
 =?us-ascii?Q?90t1USfnahElYQLLrZy4+IL93bKeBbvEDrwD9vUmhkuMv0rY3pC6a4yScZCL?=
 =?us-ascii?Q?W2j3/TE4asS8uby3fsVrIYUOnWURKk2H8O+/ijPFJn2ACleXWaAIgtmq/3SR?=
 =?us-ascii?Q?ysPaqEKmx2bMc9XNiBGC5OvYeJHO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afe9d3b-87a1-4ba9-4160-08d900457e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 19:34:32.0780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Umi9JFT6LiZAHCiiiFSCqaLFZc82VCPdGfHOiGgQWdYJGI6bTmuily5L3tUv3jl/r6U2qPOjsL1LSDMXpzTl1/PEYPVWkovd6WXpKh759KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4309
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

Hi=20

Is there any logging to enable to check if snmp trap is generated? How to t=
rigger snmp traps?
Adding phosphor-snmp recipe is enough for snmp trap to function or needed a=
ny other configs?

Thanks for your help.

Regards
Habeeb

