Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B9647E2B
	for <lists+openbmc@lfdr.de>; Fri,  9 Dec 2022 08:00:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NT23555KXz3bdQ
	for <lists+openbmc@lfdr.de>; Fri,  9 Dec 2022 18:00:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=iZLq2gS1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=53427cd493=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=iZLq2gS1;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT22W1BL7z3bSk
	for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2022 17:59:45 +1100 (AEDT)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B93m1h7000525;
	Fri, 9 Dec 2022 06:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=S4q5rGIVYmm0J+Edu6STrSF10Or1EofHMU/Y8bBwuyY=;
 b=iZLq2gS1nl3TmXEDkdJ78pQqILstvFnhl+XYBFAXrIPNPkbeq1iQP0aIu4lLusIbp7nM
 HKDuEVjyDdmQO/nI4kLnM1tI116SPkHwGGHHTsTyzDvn6w1qoljT3s5zBHLEowD3G7Os
 sVLYv2b9tYXKd2xlR1l3U/gRxbPBvhQ4MyojpsuDA5bWHJMAsN/Lz0+ZMq8RKqD4/46V
 +Z4lzofGQ29oaEg+NNslsp6tI1tiMSuTuSkn61hS+Zmzy9m4e3f9drYAW1g420WEHbHW
 kLzXSPk6mLhPXrzu8OFVcxwYxF8becwsItaZjcqlV6noW7YXb6WSQmbtldAnLH4hcdrI 4g== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3mbqvbsfju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Dec 2022 06:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHU1iMherH2kpLtS/tdsciQU4r0af2mkhCKHNdBhrj/qBC35k1eLgSx7A0T8knUQe0Hasx/iLe1kFn9dvRJI4gzkWVji5f9hHFXVuv8oq2lL766Cpw+8LGaC7erNHj+s+oVLGtHLS/bFOS0wCy4lVrDDuTPmldKfiiwB1OsMCVOq+ol83Lw/I9fmKvd8UQE21X2f/mVisiWJgzHUTCzWx0tL0PIrLyLKrmmC5gnJRoIIPEc9ERbjQpmg2mCgL/3VpfPsGHerZZGikjEGhDaxXz/02P53sEiDBuQlNwZ0qfaV/gFRSDcrZCtbplCYtW7ec8FvCRc/hak/2QulnwjJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4q5rGIVYmm0J+Edu6STrSF10Or1EofHMU/Y8bBwuyY=;
 b=lpNwxbtlPs7vXFanq6v1yC1VpG7porO6LVQUV6FI118x+0lR3x7XJ2TvEJQdBJCudIUwhokC5hW+oprD61XKgrmMYtgXH+fU/rRdTbjwBh8GNET/HDCAhMhZ+7j3d9ft3uuwi5ytG5N/liywVCaAdhxk+Of/eW7UpVqmD2RaAtNZDYpDwaBw40VyJCaNZgZNC1Ekmm9I1scUnERUG+rjZYTtALqjZPnNQD4kW930rRmVoSHUKN65TzgbL1WFbbnNJaD04SZx/8VJGp1e/gAqEIHFTuBkvWG8H0winNI2rAZOzinym1qbRIjYTi5FdTBtof/f+A6DgNcuTeAP0DHZLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BYAPR04MB4038.namprd04.prod.outlook.com (2603:10b6:a02:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 06:59:38 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94%8]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 06:59:38 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Hamid Amirrad <amirradh@gmail.com>
Subject: Re: Changing ethernet port speed
Thread-Topic: Changing ethernet port speed
Thread-Index: AQHZC5vNtqP+rU0n4E+8nG7U3gYmew==
Date: Fri, 9 Dec 2022 06:59:38 +0000
Message-ID: <20221209065934.GJ18848@packtop>
References:  <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop>
 <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
 <20221206213941.GH18848@packtop>
 <CACFAz8CXpJ-HR9RDB4DPCH5y-=kuRgwd3r_p7b7sA5CyQjty=A@mail.gmail.com>
 <CACFAz8AspVJxBnp2k+aC=M3tANYp=QCUeEPZBmAQ7aC2YUb2Rg@mail.gmail.com>
 <CACFAz8DhGibXxPNKOh+WCEEPQtmSQk27Rw0oC-sTt7OpqUcAaw@mail.gmail.com>
In-Reply-To:  <CACFAz8DhGibXxPNKOh+WCEEPQtmSQk27Rw0oC-sTt7OpqUcAaw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|BYAPR04MB4038:EE_
x-ms-office365-filtering-correlation-id: 0553eb76-4582-4bda-820f-08dad9b2f00e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EWqF5JX80+yklBSWqOQhLQiHALuZoRCVTtTR1URGNZJJJOpSgKlLHzTnaTaJLd/UMXT/IZ4trHUiUwYIYw2WVoy/U/SbMy3kBI/xUdwVLqJ2fAEQEA1E0AuY22ezE3Y/OSgLWbxrd/zYM+4f3/wMIMTXKOc8+M/yJOnRRXRCB9a+M7I6pj+XEcljaF7jexkyIAygDjxx2B+QtDCNHYfy5X6sjNYdTSF+sCctgeax5RD3+/vVrVkCdP83ro3flsDteadXXovsSIKDkDe3lcdIgqvQt7KLJ6WjjiUdps6iZJ2IdgY1F4SbX0feopFEFAcN0SrB0IrfcGBysReWTyxsLmmfw3RT7MGOaAEeRTiSCq44cRtLB6wOBT58Bh1vvkYUTonJoCo1rAFoYGdmq4vaFHwXHdw14nMP27jbLVwX0MmKVPFJRDZlK6t0BslupfUX3hA3y5qZrqM1fAmfJm2cE/4YjWD8FS5N6sWFPUAkAj6dbdFDsn6PJ3Aqrzs6HDyxT16fm/HqkmVmtSOOk7jK2HEVnrzGGdDQjC5zKHZqFgU72xsEQ5hVclX6CCS7YTuRRaC7+EnDlMDbhbQHCBr4Z6i+9AG2sgJdVEdQognp55QguuGMPomFrn92qypot5fbcLLRgD+v1jurt8DoIOIfeerVKyYa+zZZB/6iocfpcGkBldvobwXq+0UFgmXMo3tqwMfqvuqyIhvIUaNJ/FpTwA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(478600001)(26005)(6506007)(6512007)(6486002)(9686003)(316002)(6916009)(186003)(91956017)(4326008)(76116006)(8676002)(41300700001)(5660300002)(33656002)(122000001)(38100700002)(66446008)(1076003)(86362001)(66476007)(66946007)(64756008)(66556008)(2906002)(8936002)(71200400001)(83380400001)(38070700005)(33716001)(3480700007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?QZfDHUGQwuE5SwDdNzphFaIeD/gI49v1lUbPOjJ6K7qAIuj5Se6rTTJ9x2X2?=
 =?us-ascii?Q?zLrK4tZrnqkAGbTFQsKzwAJW6cFEBVZztsQFhxfA56nFpf/wcQhaE1Fz04k9?=
 =?us-ascii?Q?zBHO8VEJ+GBFRtdRT3XQMtSOfjA2XsHzlKWQE2f8m6A2WIsj3jIWOmz35Gmr?=
 =?us-ascii?Q?GHMfo+WfKVodj+4QKZfMnSZExkeqHOCl8dG4X+H2UlwEGKj8WgFuBBOPy/x3?=
 =?us-ascii?Q?okqCOxHnJrgKQSqltWUkIo4ci5Sqaau1PPrkZbbP4yLIBtb1cc9oxzANjfbb?=
 =?us-ascii?Q?jhGgO046O1t6f+6p4KhVaD1klEtg1MnY7drqhSDVvWRolCB38/4Uyh59dpQV?=
 =?us-ascii?Q?H76OUhMEH/TiboXvWMdiGlNThz3X/3w7HLAKsc7Np+93jyKXE+VaCWKa74+c?=
 =?us-ascii?Q?oCiIxCQc+fHxWWgJh/ep9uiDPkfIIurBSTWEgoMg0EiPN2SUwa+xeZ3xvJp6?=
 =?us-ascii?Q?NEKj27wbS1RWlEpfiM5YpOpvP8+mFVefgoIMrVPAFaSdXH/G0oXGJw5qs4dV?=
 =?us-ascii?Q?j/NGLOe4F2sxiS1tzkia+Mj+lyi2QC51b4qhLVMNBMedH1XowlbnrlJFKcxD?=
 =?us-ascii?Q?9peedxNSl496eVicc3iMJKICJDl4iKZldpHOswxag2MtykGsSQkS4Nz6VXOE?=
 =?us-ascii?Q?Y0gDtSEgUQ79pJE38i70WWJWWc35WWc11eyF/W2yj3zahG2BM68zP+G33Bhu?=
 =?us-ascii?Q?347R1oiwwf1J7t1WGZjXXsBjo/vvahx/nzgfPur824GUou9ff046yi4QwYaJ?=
 =?us-ascii?Q?TNDbNKY3rLo8NPwAi67JmD88L5gawUdy21H9QYaYe3Ad8YQIFGiopV2yuost?=
 =?us-ascii?Q?HqwdXQqovNeFp4DhS185Zxrg4C6VdsnFwLNDrkZf+QixuSnF/hQrvwOto5jz?=
 =?us-ascii?Q?8pNlOEB8EM1muvR10DT6IbFNy/BMRFdk7jQ7ye9Fjrb2n7pDrQJBRF83faS9?=
 =?us-ascii?Q?FCP07B68lPcwMh6B4j3fAe8rGbJgl2zQ+dHe2LNcsOs6WfRr+0RyJ6aucj0C?=
 =?us-ascii?Q?+dUbYjQ65m4VVnm6BvzguLUw2acrnVcBf513a7KrPRkvzI52q4zf6Z6XeecE?=
 =?us-ascii?Q?V2IvPyg1iA+1LIBrQk5b5owSXxQDytqI55vn6E8yT612tVvX1SSRZZzeAOVt?=
 =?us-ascii?Q?m7nOKaBDhkiegopUbFAWpOtPZ4UwriaSswM5JTnDah6s+zfr3M+QiNXeGCYT?=
 =?us-ascii?Q?csNt3D7XE1PO5lsNC33Mm60T9OYCITrm417USrjUF3XGVeag4JDqiI7fnslq?=
 =?us-ascii?Q?H5uvPCO2WY/djM+D/yC/nRVoQH/VOrTyu7Dnf6WEwihNZ+KhkVbDm7JzLkq+?=
 =?us-ascii?Q?dLV1ac+czkRypMUcGywMjnes6W/tvR7x4WA1Qc3jIf9SC71A/P9jU4HVSP6x?=
 =?us-ascii?Q?xOvJBzOb+HBzYJgua+lwKzUVUeMOyzLAr4gFBEAfMGRy6KqXa2a/NtROxUjc?=
 =?us-ascii?Q?7SaJTalspL2k1aEOz7Dg4gtxHceLc3Sh7AvExC7H0ri2UvbIzPOtKrsgo3Bm?=
 =?us-ascii?Q?kHmvP7kfPbGdPW3iHqoILW1mykjSEaVlECilJV2xJycVjqK6T0FaxAzLKdoc?=
 =?us-ascii?Q?U8xOlhWO/kD6a1hyyNnO3t9UrmCxZoymNsNNAwH8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04BDA55130DD5B4FBD2534380E867349@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0553eb76-4582-4bda-820f-08dad9b2f00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 06:59:38.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2WrE34bg30Po2hqjlb6v6SYF/gmMUJEIgHBrfqTHPhSTdv1ViHXcJYqjcuVZd7cgVzfn0QBoZthyWwQzwsOr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4038
X-Proofpoint-ORIG-GUID: QRPSBmmdE4_kY7K6_j-R4oF62jDEOXy1
X-Proofpoint-GUID: QRPSBmmdE4_kY7K6_j-R4oF62jDEOXy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=978 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090059
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 08, 2022 at 06:46:18AM PST, Hamid Amirrad wrote:
>Hi Zeb,
>
>I found a default username/password (root:0penBmc). I can log in to my
>newly installed image. The only thing that confuses me is that on the qemu
>simulator, I have the following interface
>ast#
>

That looks like a u-boot prompt, which would imply that it didn't boot
properly.  Do you see any messages in the output before that prompt,
perhaps something about failing to find or load an image to boot?

>When I type (?), it shows me all the available commands such as (version,
>setenv, printenv, etc). Also no password is required to login.
>
>With the new image that I compiled from the github and installed on my BMC
>Module, I have the following interface:
>root@evb-ast2500:~#
>
>When I type (?), it doesn't work and I have a whole different available
>commands (mostly from linux). Also need password to login.
>

And that looks like a more fully booted bmc.

>Is this expected?
>

For a normally-running system, yes.  I'm not sure offhand what might be
causing your apparent boot failure in qemu though.


Zev
