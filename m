Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DA49BA69
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 18:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjv7q36CZz3bWj
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 04:32:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ipbgBI7s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=4024b5ac2e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=ipbgBI7s; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjv7J15V8z30Q6
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 04:32:23 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20PFZi2i019204;
 Tue, 25 Jan 2022 17:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=2ebrTLm7Jp503gt6uuSQjILWWuGq39Iv2xztHQzAIBY=;
 b=ipbgBI7sNGg6InL02J+KLO67UEAN7owGeOtM53QBr+hP+qLdeyU61R8FGZHO7jK1tjE5
 EjrbljyW1oUah5pPy9sIyuxV9ar981VuqNQa2DxYz9++gAYGxh+yHtSucgE5EMikVJIa
 XGJrU6l+A+5cpIYF0ztHLY6DHqtXSAjThBuzD4XfBXEUXfG3y/NGiRq1VST7QBBnRyhK
 qiBjwTt1H8eCfUTnZ/eXpf8jlJFp3/4BCP7YiatZvQ1G0VIb8FdeYAYJoHTedCNC6NOf
 n90lL3b9l3oqTXBO6tz+VzmLAK4axjh1P69S7zkDHXzEzkgDRAbTaeEGL0oTJeyJONwY zA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3dtkyy0esw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 17:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWNWvl4RRyKbxPfL6IfOG6NGQZ88AuqBllfLO8IaWE3pIhmHjBKGYjJ6SzEVJM/2Vy3Gg0y7qo9F6vE1vKWm9zr0wVSGXJ4Xx6bZ0sLWeTAFtMEaEktXf93x7QMyxl5UgYHoK6Uj/mUHUU8DXxdXGtl2tTZ+IAgUiZzDMvqVXOqD9b+pS6q3I7EV2VD/pLd6QDmaSCc9G6pyP7sGgXXUmAkOpA9jwO8s4fVvKLkdTMQR6axDVVlthmhLQmbp6QA7HC1o4d+5YIoMRx9JEMkpEumcg4/nxkINthgRXTsb+Tbm/TAakruuCg7XeuPwrFNYLr69HXOWMGVtRxuvYyZjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ebrTLm7Jp503gt6uuSQjILWWuGq39Iv2xztHQzAIBY=;
 b=NecX9nMyd+HTvly409ufN8G9/Rr+2MLrRJE4tle9mvbg2OAJhid/q735C0oZvGVIDXbu8l44dLqAcFgRSI6r0xmrSUooLdJZ4r8UPQiGuqX4I0d08JgREfFKCRrfMzfBgfbSI6SUWmZJBEXYF22x3cwxGmSxfFsWGwHNaDnUzTmjpHGR1xYm0m+6JvQacIoSqPRDhrIvTmpcSmSdKCoHE+NRaesp3AfXUm/cWawJ9YbjZPQyGjkJAFKdxxI9MtljQ2PyiPWPeKrBxCyw3JMX/MwGjAccXIpLqGmeqzF+IaMrGLid+FFNH9N70NVRFHbj91qqSlyfClAJg6wEe5wbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BYAPR04MB4839.namprd04.prod.outlook.com (2603:10b6:a03:14::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Tue, 25 Jan
 2022 17:32:07 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 17:32:07 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHYEhF55AkoxLpai0CAwbjsQbh25A==
Date: Tue, 25 Jan 2022 17:32:07 +0000
Message-ID: <20220125173206.GJ5754@packtop>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
In-Reply-To: <20211213194703.24060-1-zev@bewilderbeest.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 418c115e-d3ea-4bdd-2c08-08d9e0289c1d
x-ms-traffictypediagnostic: BYAPR04MB4839:EE_
x-microsoft-antispam-prvs: <BYAPR04MB483942BC092FAE17B4DD8ED2C35F9@BYAPR04MB4839.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:194;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gNfvLGnnD+ohnvpFpxhnc0yNfRKaF6xXJFnUseaSjwc+kTVP1Y+UZUnn98vbTJF3yBviVtDr9iQKn87cW2PRfsr5JJVz4Od+K5JjkhFHHSUo+WJwWiN0IlgYkAb/3csF2jYb6KPGq9blc+7HqEcWYq7hQNZ6uUm3UgXnh73tYYJHttMxOLf31G8KSsAkxzmurvJ+8FZjAAy7sLouGiXTFpWl5Lq2HBoyzHmq/N6ksxryghun27qWE0/5EQdag7L12cpGxG7m4ZQtjyfHo/9HrrYX4oGrnTBlPPpIWHw2J3eITdbt7DrIKc2bgSEbDSLXcgtBgJCw7ywF4/7o+WIGJWeiR50Nkjtqt4QVfHiBRYy+hupZdUg7pR8UUotqjcmYDfofa69ENrhNAPxBvvc365vYOR7JiX2cDR+CgfdUb4ep0Vb5XCswNn0gkIorbjXRW7bmHn/l7qLB0Rq2rkfZuFwhM4LasFKO750CKs1B3QC3EF5/2wtXPZGw8uxiE97gbkFA55Gu9jb9851zUOo85yxR8ZPLGzNIVs4H03Dh4/3t1OzGEO5HesnbVnDKLT3k3uQA8sQP0gL7TCeyad1dK9+bJSH5GcKefyNtXBYfYG1FnmpZVTA8FNdjW0/s+5OR00vhBoSIvpKP3jcTrY1wYi85+zSIMXiHSdxwVyHo0oISUQole56HpKCMFfJSlkJXGzlmHUySCYiNQq0sw+A+GQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(6486002)(508600001)(83380400001)(4744005)(33656002)(8676002)(26005)(91956017)(33716001)(6506007)(54906003)(71200400001)(5660300002)(4326008)(38070700005)(316002)(2906002)(9686003)(86362001)(8936002)(66476007)(64756008)(76116006)(6512007)(6916009)(66556008)(66446008)(66946007)(1076003)(122000001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PzIvgyDaBz17IiqlYrXDF/LPAWUgChCcv9KVPjfM+6b6Jo5iO++mUHd5xeqD?=
 =?us-ascii?Q?R0mtauEZufTId8T6bHmyu4lOPjBfeFIj04jKbSEXHS6NCwudIdfZdbZATa+n?=
 =?us-ascii?Q?fzRTN9+OBuzcOmrhi7kZugGyAmZMagPzkiCh7i+ktXylzkCW/ROx5IMiOrLE?=
 =?us-ascii?Q?fUzx0Irj0Y38gVMEXeQ+7tFSeJIvvxGo2udJCLjfhYkbTrQwP46+v3/07ffB?=
 =?us-ascii?Q?vNCB/RIiD5ItLv7HqlyYTPvP7bUpaz5qW1NHDEG86OzRLXEonlNLORx4Wac7?=
 =?us-ascii?Q?TrAPE4FuGZ7Ua10UeRVXfWkZ6HUIORkxoqAlZRRvtlRI6H4/WV3tU8qF0vNu?=
 =?us-ascii?Q?vOlQbItF4z5qZWJwFMMX9ccBHsi5galqelydUk6MWaLTO/vtTRHHRbGuePaq?=
 =?us-ascii?Q?9adHM5IWEvn1Y+pQhvdGsNGy+Ll3Be4E74fM4cfH6O+eGyahlzE1PdBvzSck?=
 =?us-ascii?Q?E/eJuCs2NVQPJeHSKEnS9P+gMQBARJcSgcHzoRUJravboY29Nlo0gO9oAsl6?=
 =?us-ascii?Q?0kFXbWzLLyYqAo9GRcHnFtatvUoHLSD5zWDL732NWaXkQqNitG8rCfARW2Ah?=
 =?us-ascii?Q?PoxfMp52YvtMOT6AZPp+ABTK+vhyAsY/qh98Ti6LFWk1NIUg+8Yf4PjRzXc9?=
 =?us-ascii?Q?Dk/AXFREbtJAKmWYIBce/nSav/dm77ag0xXcJNBTmP3dF6CFJjgkmaeFzlK+?=
 =?us-ascii?Q?lg/euensu6fRypO06TOV9lEgePqG2ESCTM1rY4N/o10g1r/Sm9pTIwfyBTOH?=
 =?us-ascii?Q?c12B3WXr/aONzW1TykEJhIg68ElMBNvpl/X3O0SZPV69UAFHtPxUeEmhY6Db?=
 =?us-ascii?Q?nNe2ZtQW6yP84TOOLb+JX/IFffB0xnfOfq06GhuJ37Fsc6pr2flAHLKbNiBD?=
 =?us-ascii?Q?PpWiVMMn0DfLj+0qZVZ2Czl1fgf7n4T4/0Wa8Z4SOqEP01nTCbkcVqcEYHK/?=
 =?us-ascii?Q?ilJ1ijjoQJglywO4ub+E7lfAaw+QMBmqEd3++5rvQKaUOwmqSq8+4tvlDD1n?=
 =?us-ascii?Q?1vcSD0sMMl3Mz+3iNt8o1kbqNgxCz80dsvzyF1dXrE7/CAVOatEXDM84HxhF?=
 =?us-ascii?Q?DKHL3UV1QhqAhIMYYrt+NMofQ+/7SEhXQiK2YXLINZnxBxKX7QfL7iXw98Wl?=
 =?us-ascii?Q?a3RBtrRj/fa3XvueQ7mLG+wEwmBYnzT1uSIcbx1XPecNmqeLGUcenOIrtfCZ?=
 =?us-ascii?Q?9EAT+umCiGLjLFSH2duDTLf2Vm2Zsk8Kj4i+imoxwe6JOtYfRfIHDhBkpt7b?=
 =?us-ascii?Q?JeQIvrtDZ0txCL3u7bJe/ct7E3EH/eovEtvjH8OkUoNtE8n5F/eWdfiOt81O?=
 =?us-ascii?Q?llKk7eaqKXIwCE4Kkh0G1jGReIXCehvm73kSrYOvI21lt2vzNcDGfye2MEgM?=
 =?us-ascii?Q?aiiVZdNslHeXnUx9kOI12n20ZW9WhkPEcLhsfYxWwserL/Rs1oflIqvSxOg3?=
 =?us-ascii?Q?GuL+qmEer/553VRc288YC7oUOizExtktPoiFS8nAxDSE3F7RoVGqrk2XqTPm?=
 =?us-ascii?Q?6AlYR/lkaGCqpUKGJ2ROPKGFkVI6K7KQ8MWMWgqb7b1GackwKSqnw/4NBfQk?=
 =?us-ascii?Q?Uz8URxv2lpOdfl0YNGK/5h7VJdFqs4CHJ3fpnUu5aInlBo0jEW7ShxSJHkgI?=
 =?us-ascii?Q?XWE9st6IuX4Xb4672UdT9wk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16856C6875BEAF4C9CBA1A901C82AF7F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418c115e-d3ea-4bdd-2c08-08d9e0289c1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 17:32:07.1013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eifXsviFRLIAaHWHVJHAZIHAIbx1PeBpp0uoLSOXh0vlsJFYcMlxGgg33c+impUqHeSJqZd9HB43ndAac2mNlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4839
X-Proofpoint-GUID: s_7ebTzAQqyuI5tzKVJO7Wsxv2DUoimJ
X-Proofpoint-ORIG-GUID: s_7ebTzAQqyuI5tzKVJO7Wsxv2DUoimJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_03,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250107
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 13, 2021 at 11:47:03AM PST, Zev Weiss wrote:
>In order to support putting the u-boot console on UART3 of the
>ast2400, this commit adds support for setting bits 22 and 23 of SCU80
>to enable TXD3 and RXD3 on pins C14 and B14, respectively.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>

Ping...Joel?
