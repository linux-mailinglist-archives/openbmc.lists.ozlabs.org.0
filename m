Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B5634DC8
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 03:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH4fd3GwYz3cMH
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 13:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=i+l+/fcy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=43258bb825=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=i+l+/fcy;
	dkim-atps=neutral
X-Greylist: delayed 11341 seconds by postgrey-1.36 at boromir; Wed, 23 Nov 2022 13:22:28 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH4dw0NFsz2xl6;
	Wed, 23 Nov 2022 13:22:26 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMM6FCs025457;
	Tue, 22 Nov 2022 23:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=7TEI4NH/qV57CYvKM38eV609pzCtT/R0mK1Z8C0wk8Y=;
 b=i+l+/fcyxOMIglfV+nR26bWe8893B5JVyu39liIlc/CrWeDu/hLw9oGtDJdOiafFli5d
 BCXtXLHpW30jCxqaKSj1vQkUUpkEbdBN+udPLudHwRbvD8GggooiwL7th8nKK1hHwzA6
 SyempD4NoqfHB2H6xfEQNrPoEcXzLylcCfyFjqlGVMUf7hWF76do3Uca0inWPcIKl58A
 iGkW40IppT/h07A1vWO8l8PIsynYgBhe6LbBHzxlcqoDJyt3wx1kDWEtaQE1zp0Ebvlr
 gQetPffaHfW2xerEogEJfHEZJuixGnWymXvLk7ob210Q8DeU0trmVtQyFSEQr53YxL2D 2w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3m16wr04cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDsaQUnipOyOrqn7C4lO6BwPg+/Gk1yMslMkUB+sr9vUHLxf1zsQ3DWB/tyI/5zlk0chaSNEBrr02TQbCJjcgqRNl6L5tix7cn9PgQFi3BHTdHaPcTdqaTeGemoMqSFOR5er+a60t5vlhqpd6qYHRFWhsyVaPyMpBqdzHbnP8wIjHClHD5ItOXTGiKUhNvhiDfD4acH/zuWPMpq3FSo3z81UVf2qpaM0d43bssAS9hJyKwopgVw5/LcTl1rV+txMIwD4XzyeK8k/fUg/j8jL7Z0dkfcIcFhDVXvOHuin5I3KAkK0h4qRNdSijPxF5ya3ROboaD/7x7OcieNx/tQdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TEI4NH/qV57CYvKM38eV609pzCtT/R0mK1Z8C0wk8Y=;
 b=Bxry5Zb73nryrzUJi6of1zjFW3XhwkI2z/BWq6IJKUVqD2a9yBYJ+naT693mPI9/RxHu7L9LciV2C0Vf6KhmYyYZ5F6aPLQ3XvPEGmbmPkTZ5eLq8q+EnyCiFyDCk5SDJ3Dl6VSUX9LFVURjBZ1Ttk1Abcwps3JL+MXWIBDM4C6AnNErGEjMukEpoVRHaaqkQFVUJ/t2zImZBgAvKr97PMyqHLuIgvuPN1KQKwDk+LLnhdc63WMtn8KYSfoZALfilWu80+26HC2s7VMqre8ciehUjiO3CC6lU3bgBYs6VA0YxieU/pi0Mzvu9HyMUzPyW+DPBrlNrBXhJ5aia7CmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SA0PR04MB7388.namprd04.prod.outlook.com (2603:10b6:806:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 23:12:51 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 23:12:51 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH] media: aspeed: Use v4l2_dbg to replace v4l2_warn to avoid
 log spam
Thread-Topic: [PATCH] media: aspeed: Use v4l2_dbg to replace v4l2_warn to
 avoid log spam
Thread-Index: AQHY/sfxJh7AYvMvxEid60k7NpMWxg==
Date: Tue, 22 Nov 2022 23:12:51 +0000
Message-ID: <20221122231216.GF18848@packtop>
References: <20221110095611.522-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20221110095611.522-1-jammy_huang@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|SA0PR04MB7388:EE_
x-ms-office365-filtering-correlation-id: 2ca29159-297c-4f78-12ff-08daccdf145c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QgAhGtx24CylRnJBimambcd/DKndmrPh0veVcvHNCUJ6qsd0fv2PGzEJY+ynfr1eNGyEkNWkbAwIB/9630TVUrxEGnH6DCAylQ4tFlQIYmvx0J/RWIEeP7pKtemTxtVFzpO5+MtHO5uom72H5meRuG41i/L2cvRnYdaVeA6ULauLBOLvg1uQkRo7/Q6uX+j3a6cieFM9yX8GOntYJvTpv9VuNdy/5niXEMqyahpHpO9UxXqoAB7GWFU8n9wPeeHMBoQ8QezQwm+9yybTyI4eI2++hSdMBfCrlDIs9I8UlD4o0XV+ZmVsypukEya2CyWrQeKC8tAy+xZ2lRIxKNRWDqmusapEfXEvqK180jIBXLW6HRiyvypsoB1VG9yrgtCqdqMmlZpmfpqZ2/IOlgNAwnvR1I+ZtchQv3WSQS4Umtk3epnUpRYiGBV1zO1GWWnkhfHZywjG0jo6xafINmMnjNxe+EBEf+Q+Ok7CFISXDiAZFMN1uInwKRPdN+BDbWX+2EDHq4o39pWI6infd0ulhVO3HL5Zvl7Hml+m/YBZJhTWvp5ScvfxwRWVCOLm+yg4tQcsXvdi/KKFGxThUTLGkVy4naGyttuV3WFgNSdOUH3gkJzmitS4op3nZP1HLdldC7Lg+aYCj9faTO5vpviec+8m92Oz11wrXBARku4j3dOKUsOC0jB6NRdBV6yW+QlCVxcyXnNqWLfmYleIryinlg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(91956017)(66476007)(66946007)(64756008)(316002)(8676002)(66446008)(6512007)(76116006)(9686003)(66556008)(54906003)(4326008)(26005)(6916009)(41300700001)(71200400001)(6506007)(33656002)(4744005)(6486002)(38100700002)(2906002)(122000001)(83380400001)(8936002)(186003)(1076003)(478600001)(7416002)(38070700005)(33716001)(5660300002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?vqWQUfL4e8nGc+FVMbxRGBOxIzTyIHhGuXwWXwAXNcnwOx/+eCkiBQkLG18S?=
 =?us-ascii?Q?2NMxqX8q6Av4/Sf5CXdE0Jdkw8YLk/5wusjWjKMqvh83Hc9ARc3BLBQ9uvP0?=
 =?us-ascii?Q?qqUpxa5OaJnwCGC+6TwBs4Y4z7y4VULJIsaLvu09Kj4qvrAagtXeitWOaAWp?=
 =?us-ascii?Q?SeNgQMueRcdW6NQglyIcijuuyadZoj/YDV7f8dEAAC7+7f8e1XYz/Py2vTRK?=
 =?us-ascii?Q?fgFiP1grAbFsUIRCfct91vPLVP4nR8odYaLJHD5XMMqSJbaPydMWufgxAiBZ?=
 =?us-ascii?Q?uPJn5VyxpCC8up/3OGyWG7SqKkE1m3V71W87mEFAH95niO1q7TQ9IonpAve9?=
 =?us-ascii?Q?/XkYnTylQ8ghN0Jf5RgI1Lw7RWoKPd0O44QGEy9tLGQv+XSqgbKZfK9ZAFFt?=
 =?us-ascii?Q?TDQLyrYkqlRvdB4snhQAYp4mfMRPeAvipSyiLcM2WKI1aKSgw8hJzTOa8nEn?=
 =?us-ascii?Q?r9WMUBSdokx3jjYYgKU+j5d9z4pdMV3oqCukMELu76m6hoMWQ0TRI2K9ZwzZ?=
 =?us-ascii?Q?OvAZdA/nbnABG1SR0y1RpS9EwIXT6KVRd43aDbhzt+UYCU7SgMcGMt0ZA3jO?=
 =?us-ascii?Q?LxflLteRuqd93SGnUZ2AuMWMw6Zqlg41V4DBbvKtoaHWzm49Ge8ro0ODGZGA?=
 =?us-ascii?Q?SZLWkWQ4zVBCaW44M0y0PhqTtFXecb2fxH9ViJbyUIBbGANUdzYL4aglp62Q?=
 =?us-ascii?Q?Zt07XJbVrZLd56+xTkBoO8KEWYoqHKU0HBVlwS1PrT/ELYKg0dKFLqC1j5L9?=
 =?us-ascii?Q?DKLO/aC4M+saE+K4slwtWRp8VcChPSXHDU4TuLnPmqSApfYlK/bIoDTZZ95w?=
 =?us-ascii?Q?MtU/77JTmVRsttQSiL+Tz1W3jM9LSYvzH+r4dzkKxnJQBQed/107/oE6TypI?=
 =?us-ascii?Q?ZIkOWHdTZkSCqmq4v/e/WuNJ9C1QL3jzoDxc3AnctPbI/EYf/QOEtUygNiaO?=
 =?us-ascii?Q?j5K+r55nKouQqzfBVK2d193U1vzTOrej7JQa0PkOGa98+NkTpWyKHV1DkBsM?=
 =?us-ascii?Q?Q4ZfaRxNgRr06PcqayyKxTBVoR067hDcpUt7l82WUeNSuJoeHc5HKFwnJnUg?=
 =?us-ascii?Q?4m90If4P8x2adXhEiuwf2fydY8Ogfy0skJgtiYglnKTBLScFrRvm7h6z/Txx?=
 =?us-ascii?Q?mpf8vi6hkOxgm4YjjF+kn1/87nPCqi0WTBqIbMIJJJ7oQR5aVWtu6H2IcChQ?=
 =?us-ascii?Q?dIGojqkVC5zEu8r3n37mmncM0ysEBZ6aOcdgUxKD0S6OwUWkgr2zuAUJYwY2?=
 =?us-ascii?Q?p75KprrL3D7wnE0MUaF4feePKes3S9ueh5TDPaiCnslLUEfoVhp4sJzbMan8?=
 =?us-ascii?Q?odrg2FtSYUGGybzAF01dfE8eG/rz368khIU69YrOzqoDokPtxwA358roFojq?=
 =?us-ascii?Q?NJF6NzU3Rl/dbux+vKCpjSAG2zdvRqnHlTiSC2+eBlooOAybBTnEi5B2Z8mo?=
 =?us-ascii?Q?+Exldn+VzpElWjN641mQmkH3ShsDQkA58O0chq9E6iFT4N7qa0Y8M3p6FeHJ?=
 =?us-ascii?Q?ifHZnuD3+5wtVUnbxmNCdsN/0tNzIq/wgNjL0HrLM3t2h3e01kU3aab+SnTd?=
 =?us-ascii?Q?TQmDT1XcASB9hZWhanDwIsDF3EzdRM4nHsX5oepb?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E354AE76C2C474FA6DFBB2B57638D32@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?OEG61CDYWQf6gYHulEBXUvThYlPSIt/xfIRXkMjDTfB4BsEOU3ba+nQE3Suw?=
 =?us-ascii?Q?/yYMtn/p2J0VSZ2AAKMInD6lSDXvB8/3nMUYMdS1Fg8P26YBxjJGEF/ofHnO?=
 =?us-ascii?Q?5VjRlYx59GACQUXrdcDnHooPuzv7Oj6AkbNwl7OTJwAfeh+LBAbgM0NLoqsJ?=
 =?us-ascii?Q?jPhqRy5ZLZk423niVtv4vjj1kWUCHJO+VMHbLFJEAzeQZQk2OCWGDM4xfYrj?=
 =?us-ascii?Q?98mpcPk7/+XDPaN0tMvWFuA7AJbkIUvtgeoTlosXHroz9DVr/WviTiBKNTXQ?=
 =?us-ascii?Q?4exfhoXNRAHADig++0VXiAbOUGgQ3QsT1Lq4E+egVDq/wNI/h45hGkOOzkSg?=
 =?us-ascii?Q?GOCHgq49mE+6BzurPUtMPu5HOSSJSfWvyWZZB9lemA0A1N5/DOaK6MIon4MH?=
 =?us-ascii?Q?2gLeZHmkTmLrbtOAds2+FG6g5s+kRFF0o23gjHe98B/k/5psZUs4gYF8IVsN?=
 =?us-ascii?Q?SDFgxHus0Od0el5S7Ourk5yHKEK6IYXiPUNi3Z11CssgoY12ZGT7zL4IM3AX?=
 =?us-ascii?Q?Dylq+WOZgIthnOrFOhLPGm0SND5mvcviN/8hGANW7na2bFXElh/Cwk82+K8T?=
 =?us-ascii?Q?5HtiFqoojcSk1h9VjtaPGXAh/a57tKhRE6KYfe8xV5bYIgqnQQgYUPqHAPaV?=
 =?us-ascii?Q?CGSFlhYcjm2+MpxLuielGhnf5tKXSruyFJnL0lh4DS9xBjd4ryuzgM5V/95G?=
 =?us-ascii?Q?VKUJMtr6406BPtgOfJL4igSMsmp1NgJGziWrzE7zX6tlByb6pUNnGW50PL/4?=
 =?us-ascii?Q?2eb83Em5/R1gFMjCbkoUWOjJlx1ycQL0RpNtH3yN3tbeMkr0+LVamqvNUz9e?=
 =?us-ascii?Q?gw1/uikhpwjOiZy+MbUbjUmic/Tp553LcdcVNVgJVfd2SRKjtz/ehUPfuU/4?=
 =?us-ascii?Q?n9EU+vTN656AF+6Y5RHeCGjQRnlr5guNs74O5aIgIDReEUmpeGbgPrm4syxT?=
 =?us-ascii?Q?nRyGK1z2pHfP/ypIqyj5gdctKi0retGy6E+X6xwNU7c2AnAPnx6RzdPdaa06?=
 =?us-ascii?Q?ohYpjXPUnTSCNfvSkgPOOsS7mGc4zXgxbi5zwrgu83XmIB7vpw3qSPT7+89R?=
 =?us-ascii?Q?Z7DIuhLVbzvdvjCSYjnVPK6kJjmaXkVOBEMFXqHR9iYzJu7776TYdg3GNnc1?=
 =?us-ascii?Q?/Az6OjoFi4aOALoMCN7ELb4WTVE3ck+Tre7hCzK5DH9Zi44Q8Cu/E3tG2L0t?=
 =?us-ascii?Q?GMdvoEE4wr5KfYyvfw7eK8LRK45WRFdAVlmLbqlHpx2pWux5wlnFa4eD1qA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca29159-297c-4f78-12ff-08daccdf145c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 23:12:51.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLyEMuewK421g1Z/WczTzTlN/wEdc83d1FtAlqCse4r0nUFcZKvix12EGuK0eb13SQr8CnFKs/0V23C2edD4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7388
X-Proofpoint-GUID: Y_mzWDfyijHEHgwIS4RvaoLHE0XwJOxz
X-Proofpoint-ORIG-GUID: Y_mzWDfyijHEHgwIS4RvaoLHE0XwJOxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=670 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220175
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022 at 01:56:11AM PST, Jammy Huang wrote:
>If the host is powered off, there will be many warning log. To avoid the
>log spam in this condition, replace v4l2_warn with v4l2_dbg.
>
>Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>---
> drivers/media/platform/aspeed/aspeed-video.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>

Thanks Jammy -- after dropping the one hunk that wasn't applicable (due
to not having all the prerequisite patches) this definitely fixed the
log noise problems I'd been having.

I'm assuming the prerequisite patches are from your aspeed-jpeg support
patch series?  If so, since this is a smaller/simpler patch, I think it
might make sense to reorder things to try to get this merged first and
then fixing up that patchset to use v4l2_dbg() instead of v4l2_warn(),
rather than introducing a new instance of it and then patching it back
out later with this one.


Thanks,
Zev
