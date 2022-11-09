Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB4622494
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 08:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6bzD066Pz3bj0
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 18:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ewMWplBg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=43124f46f2=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ewMWplBg;
	dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6byb0g92z2yxc
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 18:22:28 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A94UAfd022009;
	Wed, 9 Nov 2022 07:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=fWLd6Z0W1dBxrSdBVW3spfbLpU5DW2P6FY2vx3S1Xvw=;
 b=ewMWplBgWKguwXxp/6Ct/Az0ShDu9hb4H+RJUZJN9e5armHqJNsQ5hNwU0lX4Wv45rst
 ryijjzvM0HP1++BaTzIFX3KsZ5q3zsLLPRlf7I2OQbhQRsYm9P6mPxby+QP4y4hJIhrK
 4yTq4P92CB8J7TP6oiNpOrVI+nPzVxzbXiscI+Bo6pCSF+2iej0k1MPthqvFFgLi2Su4
 eYt8gmnID4Er535Dwg913laYrM5UYluJHaeXOQxQOSA3J4t2XXi7SzfnX/+9MpgoVFow
 Y6tFijnPqAZmVQAZyAagi0lOXGiCjgiQAhVq6COQTFSHiVjK55rh7DjsUPDi+uNlw4qd ug== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3kr5828ctx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 07:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAyJp2Z8xRiqbCSuhn8HL/dkx9+5yAcHMuWqXFs7oAfrb1fuXn3UD7twLCtrfkylVfEs36ou6ZZFI6S/LEpSolWEMMckDjArE6qIDeddfktNt0NuV2HiNo3feRrLb9xVJekuF1IdpZ4nARG05YmQwnIkpSYhnX+wC7+YvJHsLdB/u6b7eV+4hyKnDNwGxIJ9KHLwZsMB7w+Ce5KQiw1zwM5gI4zz+foL6MB53YnAFPlXx9Ze7QQUT8nPPNlYMo0fpUJhLbEJNxxYFZC25Sj1D9hrgEz7AQQ4G3hP5bt/bRkQs2BV7iVogwGhKOaeqzU6acsGaxRA8S7VWAmFceMI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWLd6Z0W1dBxrSdBVW3spfbLpU5DW2P6FY2vx3S1Xvw=;
 b=d8q01uWz62huvNf1eFgNY28jlKlN+vh7ZykEUFsw/01xouRPp2Uz7G6I/xmHqwMdJzkwgXXSXDJaz+pts9J8fG3sMw2T5WD7MEcUbFWPes/lgxJAcPz7rqvZxC+FqoUXMzuujE7+st8A9v9RjjGCfKYskO7V7vJGp//HsnEO6GqxmJgLf0fod79mQcWoODzwQ+8yyiKIMCGJzBy2nC7C27+x7eDqbCxboURORUvpNj+3BZaiqUDH4C6hSEv4vww9KL5pFPinUX+MFlyqFrHmv+reiYmsTuHE3XcYAmOw+N53plaxD6m9F4pfpqKm+fggdt/wFE+aT/xAzBLp3UYhpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by CH2PR04MB6709.namprd04.prod.outlook.com (2603:10b6:610:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 07:22:22 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 07:22:22 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
Subject: Re: OpenBmc contribution
Thread-Topic: OpenBmc contribution
Thread-Index: AdjzZ2DKboFkgVuORM+0XUP0p9nbFQAnPHyAAAHn+gA=
Date: Wed, 9 Nov 2022 07:22:22 +0000
Message-ID: <20221109072156.GD18848@packtop>
References:  <MA1PR01MB4129305D091FE3210BA8A26F873F9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:  <MA1PR01MB4129D8BE91CB235EA9FF6BB1873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|CH2PR04MB6709:EE_
x-ms-office365-filtering-correlation-id: 75116206-bc7e-4844-5dfc-08dac223251a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xHMaIbQvZKyR6657Zj5ADvrNbzHi+pCFYObp/fd1RwTxBcDdk7oc1mcRnRhUwb9FUaIi3c+VqdDQT2RyGtehs59rnqMl/+7mGgAzP7QKN0sQw03TdWncK2LJZWqhR+KO+t3dgLZla+hT7FNMauXwepzXj6T7RpKLTDhR1h0JXyArrUeVnsRTMgqDXinIQTZoTOexr5+0pObLaoRs4LtaDJp+IaMpCMFJjkUWfATmrYJu63fcr4/V15v9htDF59v3ApF0nK9P2wodCtfSlw7QRYEsuqbI6OqGWP2NKK3m20WDtHR5ZHS3x64nbOmswbOu1AMVcn2XyDLa7nSlLBGN/KZMFZ7GQgXRin/SRUhV7L6az+oyOXHPtZlGzHuSUBmbRxcqO/EKzEicoidFA+bY85v1KxsFUsDjH5URetJeYiU5vavohSHrox8Ac0UrOR79zkVVgfj1JKfxMFjYG86XR6ncaCFysxs8mPKuPxFQm2JArG9HmkZUvZ0JOU+BSvBjdnDLaBcEWOxvAtfi+Jcla4+bmwGPWy26RkrlaZGRDlu/my9k8R2ls8u0q6zYW3qSOz0WIAYhjXK2qag0i49d9/kAcxIQ9PZPQLAI5n7Lz59/a2wp88vubaQakLiJqmZfP3LBAxkZiRywDlKJGMMkvVriGCGumh2eDqGtzoDvIfwzhi7GYSKN/SFr1GpJ/3UhMxBYTxctyaYitzLQ+ASaW0/Gmkl4ywo0JgUi2tIlhfIFccvh0JN2Z/ZysL1AOT7t
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199015)(66946007)(33656002)(6486002)(478600001)(91956017)(76116006)(316002)(38100700002)(71200400001)(6916009)(66556008)(2906002)(38070700005)(41300700001)(8676002)(66446008)(64756008)(4326008)(7116003)(66476007)(8936002)(26005)(86362001)(9686003)(6506007)(6512007)(5660300002)(186003)(122000001)(1076003)(3480700007)(33716001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?5WRuwowmqJ69E10jnwXZenfEDWUJLLjcMbERafTd7pDr75DaOks8xK16r1Ir?=
 =?us-ascii?Q?DpBjkF/urEYyybfa3gryLgcLqCAAcW31wBPdEbG75H7qY7VyEMp/DJwLxkeO?=
 =?us-ascii?Q?EI/9jkbvLhxpGcNLtenmwdaz5i4wgHMyjCbRgXlFEU8XiSHVWes+gPLxmML7?=
 =?us-ascii?Q?ML7CqdakpDRAPoGZGDXrfweZKOAK0Y7fnbqyYFRHhS3+yYR39CNsT2oxllSS?=
 =?us-ascii?Q?HOz2p6sCTwhpjnlu5bb3yC8Lplf9+htQxY+tSLCNExrk1MAKbiLWd7vpouqn?=
 =?us-ascii?Q?kwEJ7Bzyjyfn0GjToPdlIokZm1aYZJFgZvUU2wy/+X9BYF5iDI0ShY/V1QqS?=
 =?us-ascii?Q?cN5685uSyuMt8v2RlhIgdZAqGvCNZr+C1NoILYuSyWlLxsQoB7nATjsNJlS3?=
 =?us-ascii?Q?TwqZC+0+Mg5/u7Cj3kiZ/QvlKGJT627jaUXOkyiROxtGSaEigaeTXse60FVK?=
 =?us-ascii?Q?DHItDSbOOLoQ8bo+/Jw/alLNX7m2z7lB9MpZpUfQCrnVFI4imjTYDgb3CJdM?=
 =?us-ascii?Q?sWMf8NCnwGS4EabnFjp2pMjn/gBi5GgUmDUdt8B5wgN5u6K7EI6UcpDCCIrO?=
 =?us-ascii?Q?74oJ38yR9a++ouB5BPDfSYdSwLgTcYn0kCUYXe+FnyU3GWCaAm1LBU8u/RuA?=
 =?us-ascii?Q?qjdoi7FhTjGBUcTITNl0ex4LOaa02hjO8rDEiYiXyZgkwLQ1TjR3f6KxsPD1?=
 =?us-ascii?Q?kCGuKfH2QmvjuQ+zEjjE3qbuW0D9TixCPPRPsR8MBYdWFZAGbMqzSJZCL3zT?=
 =?us-ascii?Q?+cbsLslJfDS88Qn9KZU7eGPuc/9MZTppyNCDTR+RayeT50tfjpUYhyU3zKfX?=
 =?us-ascii?Q?wq+dJ48428urZr9gN1MnpyBpRWs4Lgu69BZsfzXDTKVTSElZLbr4L3AR0fU9?=
 =?us-ascii?Q?1+8qmGH04qlcgkCmIvqIaEVVIDNPjJY1iQ2/k9bl7Hk9pFzfNAWHbzRC1QT2?=
 =?us-ascii?Q?LeEU3ZjStL3te6T2dopuKzq5XPJehVjwThANtnMBDtVx+u29D1PIRngx6wHk?=
 =?us-ascii?Q?H1Pc3NEsPF+UUBBBRX6D2Za6WAtb/UgegtPGo2LLNMDw9uSFGTqSVOhdLqnM?=
 =?us-ascii?Q?tpyOLAwPMPQlSCgLLMLLYNJQw9zRUHrGM2pvnMXn8Y7eZdLBeHlfZ44cVOTR?=
 =?us-ascii?Q?+MYwpIi04LGYoeB34CJmTDigqd0On1DDH0abVfFYAuXHKS+Sctd3/L3ubtgK?=
 =?us-ascii?Q?GTKMojuLOTeJmiqAAjUHD3dS+p6dV0wOnQ07XENYFsc0oWVIA89bJeLRHqCE?=
 =?us-ascii?Q?DLS4JhNhTMvdSsXLTd6ffMthnKUSHN0jqcVIfg4GmIGEkgkhwa1zspZDmzpY?=
 =?us-ascii?Q?YxgS8/YKIsCGmtpw4YeICL8fkaxwlNZp5VYjv9kbjiB9IecmRG/aaL9+pyXO?=
 =?us-ascii?Q?9GS7v2GoH1fPS+XUQ6yrH7F3yPqFVaEFqzR7j0DJZBM1f4n7qirs3Ow3D//E?=
 =?us-ascii?Q?zyeMnXF3llTl2TsIJuvlTDUcgUBOn3xusT3HMlL/ZjEntdmBYhHtBnVOTeQD?=
 =?us-ascii?Q?JzS6TSxDOikTu1dbu2cJvZWLX+MCHY0Ex0GUy1LOekPYRAUQdFDkP7/bSkzv?=
 =?us-ascii?Q?1JpXG2TjDjpDgN4j9kclAAJK4n35U16WLzfEWyvK?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CE75B8E0431524D955EB45FA5792A48@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75116206-bc7e-4844-5dfc-08dac223251a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 07:22:22.8163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcUh0R+3+lkIhVuRVrdC0WlhxqKK0tMlEvb0uOVvM42bd9/D1i22YDHOy0hr2/gpta8ES3Nr+ShiSCG+dIzidA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6709
X-Proofpoint-GUID: r-YsOswjrjASB-yr-Qi4-DLOgZs69NtH
X-Proofpoint-ORIG-GUID: r-YsOswjrjASB-yr-Qi4-DLOgZs69NtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_02,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090057
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

On Tue, Nov 08, 2022 at 10:28:01PM PST, Sandeep Kumar wrote:
>TCS Confidential
>
>Hi,
>
>Any input on the below query?
>
>Thanks,
>Sandeep.
>
>
>
>TCS Confidential
>From: openbmc <openbmc-bounces+sandeep.pkumar=3Dtcs.com@lists.ozlabs.org> =
On Behalf Of Sandeep Kumar
>Sent: Tuesday, November 8, 2022 5:30 PM
>To: openbmc@lists.ozlabs.org
>Subject: OpenBmc contribution
>
>"External email. Open with Caution"
>
>TCS Confidential
>
>Hi All,
>
>Is it okay to submit our changes with testing done on a qemu?
>
>Thanks,
>Sandeep.
>
>
>TCS Confidential
>

Hi Sandeep,

Bear in mind that people working on OpenBMC are in many different time
zones around the world (and are often generally busy themselves) -- as a
matter of etiquette I'd suggest waiting a bit more than 18 hours before
following up to prod the list for a response.

To address your question, I'm not aware of any project-wide rules on
that, so I'd guess it probably depends on (a) the nature of the patch in
question, and (b) the judgement of the maintainer(s) of the repo you're
working on.  Feel free to post a patch to gerrit with a description of
the testing you've done; if the maintainers feel your testing is
insufficient for your patch they'll let you know.


Zev
