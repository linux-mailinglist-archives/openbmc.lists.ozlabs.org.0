Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448598FF800
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2024 01:15:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Ry7qtGDX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwKtf21dCz3fsj
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2024 09:15:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=equinix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Ry7qtGDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=3887686b9c=zweiss@equinix.com; receiver=lists.ozlabs.org)
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwKt05jvcz3dJn
	for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2024 09:14:47 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 456NAuut002007;
	Thu, 6 Jun 2024 23:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=cc : content-id :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps202002;
 bh=f8T5c+V4WXDR8QEEpq3hiojmBwwsMonMqzQ4cHiQUYY=;
 b=Ry7qtGDXWWESFE+gSVWufsFPSceV9rcvc2DruHyLMJF3UlnZECqQYbUsTvrM/EvDZTwp
 z8onpya7MCwkSMZqF5uUxG5ZzT7W/5srpFWNKi3A30QNua+MfrUMH3BjBOmcpIMFShpg
 02syTnIxxpL4N55FLEtSQ3LXHoKtFttANwxuDp/k/vHVh5olqy7zJ4wGwrOChFybG/tG
 fasXNT95wc/nveV/OGvJaOKle69CnX3NbgNI4SnjL1V1y+duw8K7YQIGEuwfaMn5wi+3
 wUu9T16uxYKEVPx406mU1bnaQIpkoFid4VGgUdbxFcCF/n66Y3ujtvdH3pTLE5Tx8e3z 3A== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3yk78n59am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 23:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZNl2J4yPNlMtF53cJ9c5E9WURPxeqEziDlIcktA0bVl456p64k+HUYB4yEufYfiqCvTRxt2ytdeUGw30WriPKgZaDMDajTsWy82+emdA4aut8RnvZv4xYW0FfjsuiH5ZeFPNO/zblcw1Rg7SKQYOVCc9N7Ngc9vQGODl+gsHJpVdDqdSpdEhzM8r7KXhfooI/XjfgxnZlGdbIvjcsTDfarSblxww6aF76TH/aRuJoHkEOIMYqNDUDqErZt3fr3QuBG7CIQVBxOs/VaAHTKL7lT7d3+xd7yUgq6c5ahLk82kG13TfvAI1xtv8S3s5UQpEyOqumZZDGYj3M92s1T+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8T5c+V4WXDR8QEEpq3hiojmBwwsMonMqzQ4cHiQUYY=;
 b=MvpVgNtNzrgsaXtlEn1qFcIU1+gJE9HKyfOsGqP8a0BtzdPRBdJh67xrexFM/Gef0JEukwuvFv0+p98UAuKRPE382M37Ng3yVM7SEb51PpbpPVWVkjsIlcBHofiXHlKTBiYaLtxUgSuVNUCyO0TFBc3h7T896/gx9oa3j4A8J8OOaQnsZBF2E4T8gHhVBrLDoPwD5fETMhj/mlCEFlg6l5nTLk0F8qVXZsnxti7qaeqhYOkP0YQ1BhqqKS1sMkBl5FmBDcollQmuKc7j+/XpXJNJCXO17IUolgqcl4LQTGx4puXlu/cE3emGncRmL3eCLwMTs+53+L3Kq64yFdK2eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by MN2PR04MB6878.namprd04.prod.outlook.com (2603:10b6:208:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 23:14:41 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::9337:6101:9e7:9c95]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::9337:6101:9e7:9c95%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 23:14:41 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
Subject: Re: bitbake compilation errors
Thread-Topic: bitbake compilation errors
Thread-Index: Adq4SyTOApJzinevTfm5EwGOq4vn2gAHCnAA
Date: Thu, 6 Jun 2024 23:14:41 +0000
Message-ID: <20240606231440.GC6918@packtop>
References:  <BN8PR04MB5906280BF43CA24D2EA9E1D094FA2@BN8PR04MB5906.namprd04.prod.outlook.com>
In-Reply-To:  <BN8PR04MB5906280BF43CA24D2EA9E1D094FA2@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|MN2PR04MB6878:EE_
x-ms-office365-filtering-correlation-id: aed7af3a-609b-4f4c-975e-08dc867e71a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?Ugh2A9FrQAUSwMKLyd8Uk/+qdQXUqPvj5n0lsf0tQPp7Z8sEp8vWq6pwhjnU?=
 =?us-ascii?Q?PBP/Ca8k/MHbkK0hPxY+QuvjyxoSh4JyOD38Ak8By8R2Uqg/JXpWq3ZY4bbn?=
 =?us-ascii?Q?3FQcZFhrHktbnSz7gKmsCMmufA2SCphgxVqh2a4UyOywpB+Ty26aRiJAgg0o?=
 =?us-ascii?Q?rNXvmxlKXV3741azR/S4myMeNdo5EcOR1FOMoE/euD3QXlrpt9xNxiGM3fli?=
 =?us-ascii?Q?rFjIryLg8YjhezUvHAvYuAU8kQcOghwmkbhGOATjOhq3Dk+KdpIXFMYgCr64?=
 =?us-ascii?Q?zf4ArLRG3pBTjGH703ueo0Z+Y8w9JmPbz/KEV1WQG9mJEGczMAybghLKoPBN?=
 =?us-ascii?Q?/dcqn6pHHbDkfjgl8KXkhJ7doY6KD6jcimFuoXC/6OUADwzWWYFvwXM/zSet?=
 =?us-ascii?Q?a7yqzrK+N4IyK6ClgoZbVwdNWpRFqycrUzBhEcdNKAyam1HoUFD7l/LoDiXg?=
 =?us-ascii?Q?7pg0NaGJa4A8gY7jksekLYNp5Xl+OYhVdxWiWmVyL61Dg3ulyTGPaLyA1ZdG?=
 =?us-ascii?Q?x1yN8sfi9CIjY3V2biNWho3XqB5UheTnvsekajkTcjdHJx9oSoGtnPaSn6D9?=
 =?us-ascii?Q?WgucdfqEOc9G1MgEwPii82KjQ7m81fzD/1slf4t9T662Z1CxwTT8QRfNT3B1?=
 =?us-ascii?Q?5ltIwIYMogpfJ6X3lp3DlcKJZO+nCOsv7mkkEfHbnHCFWjmXxwnlbF/Hy7ne?=
 =?us-ascii?Q?HECfTPA4ChRlnKZFTe7zrVK4otGAGspXbNJyObE96Cl+gbMnUe69Wv/B/5CF?=
 =?us-ascii?Q?c19tFhMUwEk/aatKQ6DAJGS4sR/1t8HZEkq/QisTNunvvsr3QkDReSfsyhzL?=
 =?us-ascii?Q?hOSxt3y+g6B41yB3gQJtyjI5GtlecA3wTJCFfeELlMHaJ4mbHPFFpd8Hnwoz?=
 =?us-ascii?Q?zZjBd9KDgGDuAbPQw8jSFEOwTRQUHEHDQpwcxlzeqU7xUOmtAIRgX+aaYp0i?=
 =?us-ascii?Q?xv5B69FynPawwXJlPmErG/fHf86ByAuPYOLvWuidqxM2xvVicTCuK+5x5UZm?=
 =?us-ascii?Q?fAoYdfFXq2DhZIYl72BOwx7P8xugancxdvADbh6c8KQrERiapp6VPe1ADXWu?=
 =?us-ascii?Q?YvSXc6m5uKkIigg11n2pxf60E+Wsh2bazBj7VzhKJ3mILg1Dk3ycy28G5s2G?=
 =?us-ascii?Q?FfiQuKlqoISRtiBSfjguO8OUAsZc4n+rtnSdHMWYzrkI0RvuEK3qINU75XJ1?=
 =?us-ascii?Q?TYIgWuBfdg7xc79vVFl2eltduEizR5MAX90o5W3O84flpgLgr0evLulLc/8m?=
 =?us-ascii?Q?EoNlrtb435T4O883gzJGtkJnR1rE0yOqX28yx3j3vGVcAFhSVgynbqi6GY0o?=
 =?us-ascii?Q?gQPDMpfPRgK8WCrtAFmTtQCU77o3gm7SvTt1JbTYVZYccC/IcxHuurXIxcvj?=
 =?us-ascii?Q?0x6fHoQ=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?zUrsHJbrxnkklhbvIEb018HBJHbZqGo4ZKdCcg+7JVvnBKtjADqsgtNiPI7a?=
 =?us-ascii?Q?nkPpKq0NshbXgV9nDOAsBxOr3js/t4BvKR+JTqCSuT1IkS0fftsHzjG6Gb2V?=
 =?us-ascii?Q?Slqo6Kido105jEul99ajS55l/q8mjSDTHH3iIJAGMO+sgwpleAGjJqWR8Me2?=
 =?us-ascii?Q?d1OtlBtdWbKsL/wEG5vBjwHyH2XApvs8x/FuGSlShlT/oDfxvxYkedwAmz2f?=
 =?us-ascii?Q?dH7H6W+7JgbSe5/+jbbF7IblnTmOalqt4xqc1J+XSJIlZmAYAqKCTU+pFW6r?=
 =?us-ascii?Q?SYB851Cv7n/UNao9FNEanp4CS4CrGX45CSWhTmcVkwFkI/EqutwhztMmqXeE?=
 =?us-ascii?Q?qXcCFgSX5gjUbdbZDJZYRpc8SD+qB2Y5iMmT6fnH4icX2KiTOh3QIgNO8ZWD?=
 =?us-ascii?Q?dI1hekLblbRsAmf3S1W1kTqsnasbBslMf1tqJoq4hRUA53+XhQmedMdFPeWh?=
 =?us-ascii?Q?202VRbFdWXLWWcnuUEsNdEmfLdl3WlxJHXtBOz0VO3bnRQkBi2zOOGTqaS63?=
 =?us-ascii?Q?qw2mVrXhLSDxh8hwAGcPAxtM7LtzzXujSosPdXk+WTRt8DsjW7EtyQNrPX/v?=
 =?us-ascii?Q?YFn9AgwsRUAj3E9T6PeUdH/DYppY1gvQUrbuEnKrmMaJptkjyQfMThaaWXFF?=
 =?us-ascii?Q?lA89YGuR/gyK2YCy+bMGt02xLjleOv4omLN4/jJX2P+nozBFlmlhLq6J9L6U?=
 =?us-ascii?Q?UYUSotsgJfBIUn5pyrv7WA52+hh/kQ7j2dG3zHpmcNnU7m564rRqwPZhB8mH?=
 =?us-ascii?Q?LLW8EVCm5djSkUBITlw/PHa/PZy3ek2Xx/cvApOHRFIwFZSItnBQoBpYszZ4?=
 =?us-ascii?Q?YKyXFdL6ilC0cocIzcylA92bv3TwG3tWfCB6M8lUPvpvw4It8gB2vG3fMCgd?=
 =?us-ascii?Q?qDXmPA0lLY383bKUbZcL8Mv6cC49IP92I0KcvykDW8q+n7t0CHtHYekrkJCD?=
 =?us-ascii?Q?27bmgD7ydqceyXep2hs2QaINl4eGUZwJlggJqH2Mq9SqPU8Eajkjg3zRfe/d?=
 =?us-ascii?Q?mDrHiRmU/l1SIof5DUiUhZrqScwghc1c8lOXLzTijhy3HO2Gpw1bxDdG5sJ9?=
 =?us-ascii?Q?w092jK9Xo5UVpeHkGEWYhjKPgE8AXVfBi7IKv29NON12np8IzHANHS5tuiZZ?=
 =?us-ascii?Q?uJnfXe5CqufO8urnBvLisW2rw8tTa/E32pX4VjoBxZTkI/MRBN8Jva5JuE1e?=
 =?us-ascii?Q?klZ5ylaKJFYr9aKCA6s7UcrZ3ZhGyzF8fu9oycZ8i8ypHaoEsdLrOOrDVfXr?=
 =?us-ascii?Q?l/vrlZdujTgAdID4PUa4XDJ4csEyLpx99TtCn0DibRoc7PbxqUWvXEGrHQUb?=
 =?us-ascii?Q?CPiAj+6uTHfzfP8vEXI01A9llc45hXB31RMLWYsg9eSAKqLUpt0GRFIcLvJi?=
 =?us-ascii?Q?kdz2wlZheWUe/SQz66tHrC0TaAs0wg43l+KDS/fe4u8sL6pBNn0Yth3oz442?=
 =?us-ascii?Q?AUbZuLjEs18Y8R+nGPfO3EAmgtmC/ijwi/gJ1vvJn8vSsc24Cw2eEaJoeRn9?=
 =?us-ascii?Q?zDM4leCP0r9UWWgVL0ID0HOeHHyEZSX8BtOpA6komWiRa2m9L5vT7C4d2+nm?=
 =?us-ascii?Q?7WHd6mPLqGKkOHVJqVV2JgTMqJn8ieI/WAOaV+x6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFADA93580F3CB4B8667D2F5582A21FB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	L4W47tJMnb1TrWo2TnqIUSgrWL0L0M5phcFnyLeThuVEAktFOuwG/ONMAzMU3S+naF3ru4QCqQ0HWpWxdmamIX1dBAfUG3R12lOjR/KDgTmTfyMxcnPqSVeiJdJChCSGeZzP0iKGcC61ldopwKMDf2NF9S9aF6vGqdKwgGI2sjR7xLXee7yF58tbdGRZCeuXBiWK4CcPXALEXylnrlI2XZKLtnEC3KJNO7c7rDQLCAfJsjBWfZFMLcHFcP3AwsMkUTiAl8i1hyKZb8sMCBb++K3UFkJ/nugV4y0vFXd2CPxBIFPMQGJm+IyS3vmFqNofNTPFOvjKwwVgSBUNxndZfD3YgOngsU7DmN9Jv+PBrRzE+1tkU5g4xaTZUiI5V2KuiXD9ZOij49A8yQTCcRLYttMZlWyrn954p9rxJNVwqbDUCe+K06ZmT2YF+jwXjw4ReU0GpzK5hL5IxVA3eyKpLFfNQHCJDNXTuBKaOrJUzFNAoy0eVXeEF5Ke43H00sufVH8u1YkA94VV++7qZmdAS/kQd+LEOoBox+u3VQf5yjEWvJXWkTdPe7p08hfBhx4HmrjA4PdaHQZ8sgmItzhraT3kUcwOzVhQGtPtKD8xePybBpkV0jmXSt9GKtRXFtPoaqKLDfSG1Kn2xbDj7gfQjOHRYS73+j9qCT56uF9IfBc=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed7af3a-609b-4f4c-975e-08dc867e71a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 23:14:41.0331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vnuHy1RBS9vw63wP9qBoTvoFoyMvH7dlq4YuCOQGEo+VbOtBfNtwPwN7WBwOf6PFCfTSk+yFqkwgGALmUmS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6878
X-Proofpoint-ORIG-GUID: o5Qtud0oavpcsAykUGP7fCNjUxjSsw3R
X-Proofpoint-GUID: o5Qtud0oavpcsAykUGP7fCNjUxjSsw3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_18,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406060161
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

On Thu, Jun 06, 2024 at 12:57:31PM PDT, Ananth, Rajesh wrote:
>Bitbake, while compiling the nodejs-native keeps on failing. It happens ir=
respective of what platform I am building for. Does it require any package =
fixes for nodejs?
>
>Build environment: Linux bld-ub20s-openbmc 5.4.0-182-generic #202-Ubuntu S=
MP Fri Apr 26 12:29:36 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
>
>
>|   g++  -o Release/obj.target/v8_turboshaft/deps/v8/src/compiler/turbosha=
ft/memory-optimization-reducer.o ../deps/v8/src/compiler/turboshaft/memory-=
optimization-reducer.cc '-D_GLIBCXX_USE_CXX11_ABI=3D1' '-DNODE_OPENSSL_CONF=
_NAME=3Dnodejs_conf' '-DICU_NO_USER_DATA_OVERRIDE' '-DV8_GYP_BUILD' '-DV8_T=
YPED_ARRAY_MAX_SIZE_IN_HEAP=3D64' '-D__STDC_FORMAT_MACROS' '-DV8_TARGET_ARC=
H_X64' '-DV8_HAVE_TARGET_OS' '-DV8_TARGET_OS_LINUX' '-DV8_EMBEDDER_STRING=
=3D"-node.17"' '-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_COUNT=
=3D1' '-DV8_ENABLE_PRIVATE_MAPPING_FORK_OPTIMIZATION' '-DV8_SHORT_BUILTIN_C=
ALLS' '-DOBJECT_PRINT' '-DV8_INTL_SUPPORT' '-DV8_ATOMIC_OBJECT_FIELD_WRITES=
' '-DV8_ENABLE_LAZY_SOURCE_POSITIONS' '-DV8_USE_SIPHASH' '-DV8_SHARED_RO_HE=
AP' '-DV8_WIN64_UNWINDING_INFO' '-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DI=
SPATCH' '-DV8_USE_ZLIB' '-DV8_ENABLE_TURBOFAN' '-DV8_ENABLE_WEBASSEMBLY' '-=
DV8_ENABLE_JAVASCRIPT_PROMISE_HOOKS' '-DV8_ALLOCATION_FOLDING' '-DV8_ALLOCA=
TION_SITE_TRACKING' '-DV8_ADVANCED_BIGINT_ALGORITHMS' -I/home/rajesh/openbm=
c/build/s7106/tmp/work/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-na=
tive/usr/include -I../deps/v8 -I../deps/v8/include -I.//Release/obj/gen/gen=
erate-bytecode-output-root -I.//Release/obj/gen  -pthread -Wno-unused-param=
eter -Wno-return-type -fno-strict-aliasing -m64 -m64 -O3 -fno-omit-frame-po=
inter -fdata-sections -ffunction-sections -O3 -fno-rtti -fno-exceptions -st=
d=3Dgnu++17 -MMD -MF .//Release/.deps/Release/obj.target/v8_turboshaft/deps=
/v8/src/compiler/turboshaft/memory-optimization-reducer.o.d.raw -isystem/ho=
me/rajesh/openbmc/build/s7106/tmp/work/x86_64-linux/nodejs-native/20.11.1/r=
ecipe-sysroot-native/usr/include -isystem/home/rajesh/openbmc/build/s7106/t=
mp/work/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-native/usr/includ=
e -O2 -pipe -c
>| g++: fatal error: Killed signal terminated program cc1plus

I'd bet the odds are good this was caused by an OOM (out-of-memory)
condition on your build host -- if you have administrative access, check
dmesg or /var/log/kern.log to confirm.  You might need a larger machine
to use for building OpenBMC, or possibly to serialize things if there
were other memory-hungry things running on it at the same time.


Zev
