Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D125F6076AF
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 14:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv36n5Rhqz3dtN
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 23:04:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IyV2zKF2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IyV2zKF2;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv36B47NHz3cfX
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 23:04:02 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LBhE6F031391
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 12:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pp1;
 bh=YTRMLHsxEv08juVgCaVJ3Xby4Hh17fcWfHe6Ge8iJm8=;
 b=IyV2zKF2Ez3lIuOpJYo9KbFJ7asRMzL1O0JhRYfZZqi8DmX0JFks9+vOWfcT2Mspjf3l
 tvv/iPqY4HQf1yulj3zPRPNBooSt6+rWrYt+Le8G9qmp2CsjDgLu+9kBvIzejcrJc8MH
 W3LpOtk39UKbOCTsVjCIrAzAyLNjbg6lmJQJ9WdEDJg7SX/5auYXyqkdL5y7sSMVvBPi
 eq206weCltc/QdDaRoLXnjTZgtR6B5wrAuI5uDY+46OboBqY5A6YNdKvVgTDhKs9E3Z+
 JL+369Pq9EfzGKVMN1PFD/MBIxbTPFTbWBiyuzX0qCUmgBa5ffS3CpyAOn8nWVFR5aA5 Vg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbtt08j40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 12:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy4BFnor6FkMGZ5LK+W7bGwEMtzhhOaXfMF94/MkH51goeawTlyq84gYkHutpjTlTC2C/mym8BD+FqTRwGxnhhKTIQQBhB6aI63GAplYejoMIdG1OFMmuX92XidtZsoIjJuQYgPUY1NEW1PF2TJx41x9F+2xF0AL1cvxUz5lWEMIQOmw3dNYTQL9tIj9HdGHmEGg6oPmN2+RkE+PG7LL4PUgqmuz2Qo4Os4urz371e9KSIvgQ0xp9oGHHlGZuVVyXJv6qDprA3rJpQVlsQeTTQeRagiCy7XELt/suKgahIGzB6cNb8MHiFNqwqinp0M1brVE7jUFKZcBf3qcfVhd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTRMLHsxEv08juVgCaVJ3Xby4Hh17fcWfHe6Ge8iJm8=;
 b=Ftho3XmFTcaym0DiJiwJgQjbxTknxequXPXy24wMU+Vc1TW0El9ieRjGvORvZdlNxjCjTZWUquX8Iffq2wKNt20iOS56BOUidsND5k5v7x74PigBsU5YrcnY9ksJ0X3fyBsZO9XaRk0wQrWhHdFZE0Hl/6YdsP5yGvU5DzAzyFW2U/+qvj1RbncXUCSXQCaterXaY5shqKg/acAQLVIMapudDGkln3gEL4gwGVE/OdJFnArIhayvevbE3TLoiKvPj/Y/KyY8hmyMmhUQ20yoYzSKmMW02+tabIS02/WB0XX/euregIiT3EU6HT02YyAhsCVk6aqTQe6jPit3FiybrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from SN6PR1501MB2030.namprd15.prod.outlook.com (2603:10b6:805:3::18)
 by BN8PR15MB3203.namprd15.prod.outlook.com (2603:10b6:408:a6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 12:03:56 +0000
Received: from SN6PR1501MB2030.namprd15.prod.outlook.com
 ([fe80::4a4c:1aca:bffa:45b4]) by SN6PR1501MB2030.namprd15.prod.outlook.com
 ([fe80::4a4c:1aca:bffa:45b4%3]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 12:03:56 +0000
From: Devender Rao <devenrao@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: changes to phosphor-debug-collector plugins
Thread-Topic: changes to phosphor-debug-collector plugins
Thread-Index: AQHY5UISf/hO3JqQGEy1f9S44cO8Ng==
Date: Fri, 21 Oct 2022 12:03:56 +0000
Message-ID:  <SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9@SN6PR1501MB2030.namprd15.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR1501MB2030:EE_|BN8PR15MB3203:EE_
x-ms-office365-filtering-correlation-id: 4caf9232-8a04-4a32-699d-08dab35c5475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NkpWqdr11wQGMg+PFG2j/cTZ7ASCa9RKZ7pScUnPz/y30asSqbbZc7cQbnDVcZwgwhiBW+csYuCsv2e47dLguoB7E1gb+g9fCIEyagQ8vy2T4ehLzryT9T1bXwmqCVYjJO6RILWiPCaWShZcR0EE3qWmbIUMKY6+uEmiGJ9AGr7VL+p6N1L87rCzbS0SIklbQ19Avz6oT8TYMYp1peQ7E0uGuucMblgpbYdL1vb4TCRepqwRWmmt7/TNRq8xYcsn0u0J+z4nSKjDmvQbwzunbItmBwdDgQHmPGS2bEJVT5v4SWALSSAyTk4va1JA0pBmb/rdMibD58lENFKs8mEx3EeyJCtaGB5YicYEurMxKNTZ9t3rJd9bEnl+3capSqdExeJA5dunmRe6YZtNZOeUvIEVFzjWtbNV7ukP708IR1COznubOKknQ3lyCM6SnzZfHp9ufcChNFcbaOD64FCSktt7XQr1ABBGEMot837phkTDoqO3PcHyiWugbMhHWYSZTL8pGzc0FVDny2WlJH+jJUuTcqoRxyRg0pdiAzHsCsa5+09ZUkfmYFurE4w4UWhEzyk5n58d3C1S6nQ07BEUKl4NjcEUZ/Ok40Ev4mtPoAnb06N/FFLrHSC61Nk491dJfJ4S8gps+KV3BPk9qeFwf/e+xJM73nlTkBMGVVCu73TN6dlcIWFYqoqAYGKsxDaZ102eDjpANgb3AlaV1aqMi+N2dndbmgQcFYetk7MIy9D7F/jxnckcGjGQ0zgAC7RoZ27FWNpWRyv4rlHtnxOwgp/DcDmnkrWEDSo40QgpNo3/TkBcYiiQrLK9Jtwo3pK7HDG0UOiZX2PayLMlfJlG9g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR1501MB2030.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199015)(1690799008)(19627405001)(33656002)(2906002)(86362001)(38100700002)(122000001)(76116006)(186003)(166002)(38070700005)(83380400001)(7696005)(6506007)(91956017)(71200400001)(66946007)(478600001)(9686003)(316002)(26005)(6916009)(8676002)(64756008)(19627235002)(66446008)(66476007)(66556008)(55016003)(8936002)(966005)(41300700001)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?fGMOt4R0LP+I7tECHuHNFdc33cQgPksfoM2jDGOMpBQ+nd5LFlmAyvEVPw?=
 =?iso-8859-1?Q?WWLWuEJySGLcHJ8dUoZOCdZZpikxUz675hPfZ/7G6XOApgotDakYVFoj0H?=
 =?iso-8859-1?Q?TqVLpLSl6a/n1En09rPjpqL1XANG7cz2AqBmqaV13jugTFLFFLPDpo9k1O?=
 =?iso-8859-1?Q?oZcn5W+qsWc8tGKgNNWYc4fwiV4XQGtGFPLDwgLIarzQ9b8L4T61jfDjMb?=
 =?iso-8859-1?Q?kNgAwn/mmYnoOu3nqrftllwkYdRGblilxAQWbkQHQ6/F0LW5d0BvHyJDkB?=
 =?iso-8859-1?Q?tZBmg99aIxxIntU/emfgk0QeaNQ7Z6SeejkDnD1iDWg4+nnl0AwIpbEEmw?=
 =?iso-8859-1?Q?FHigz+Ky4xfR9e8aeuxo14ohSFizcBwt5bqwWjW/d6ZcmATYJbJOEsMSKI?=
 =?iso-8859-1?Q?WcNN0SNingFQ7zQQ4D+WByn9lXaMYbVq0REciW/IhEgfI4zThioDq8j6LG?=
 =?iso-8859-1?Q?Ujr3tO0uU73w3YPH8182yujJfjGBtXqatt6mEwfAj9KfM/FUExJdbywexX?=
 =?iso-8859-1?Q?KGd3DfnV9QeZGse2zKxUbSEhN9aqgldD1k3M4DKa78vCMgrQbd6w/Awpub?=
 =?iso-8859-1?Q?xdEJ3gh0hdQqOhHfHd+J/vvqz16uxZprGCe6mZzelyTeDqUgy4zkCfr9Uh?=
 =?iso-8859-1?Q?O7CBT3TSW8jHMMS7jeETE8BcwADEQhH53Sqq82v7DYwUGp33po9sbyEFd0?=
 =?iso-8859-1?Q?zM4LFqDH3u9gXQ6i4Pur9wQVYdfcIL4RBgzOObydi3YyAppXqXIVjJO56c?=
 =?iso-8859-1?Q?7gNSTij59WVdJC4KutNvpjd2VkwUkPDGt7J5MFiO0ajMoGBPBufn06/7Pt?=
 =?iso-8859-1?Q?FjUgDuFKbWpzIChbUL7iokpb6eQeA+qziG1QHJR5hnzoweZNb/vpLV7gxX?=
 =?iso-8859-1?Q?5LhL6R3rsKVEb8m9qboQ+KqN1BCmtjuak8DDB25FqH7yz9+VrN8WPzXG8E?=
 =?iso-8859-1?Q?6tWAqKEzw4ANWyDgmyiFCV4p44qLmkDZmtS8RTsMlkh6E+fgRNC5ZQIr4/?=
 =?iso-8859-1?Q?pzsue8Gmu1JxHd3z3PAx1hWCK8qtHC4amXlojx+JHLZwqHTsLc8So79/wL?=
 =?iso-8859-1?Q?4gfu6ymV54NkxUk2HhXTBjhGe12zJXShn9jgkqMXaj6t6qoeGnbrnleHdX?=
 =?iso-8859-1?Q?5Rt541KC9OuyhJDwUzuVa+MGr6mwS+X5rZcI/CHQIRt5hwBhSWUcilntxI?=
 =?iso-8859-1?Q?gm6iWwwva8MMvNtkIV6MXKAvaDhJ8WDPvfcB8rSy1Hnm45C+LzmL202kk+?=
 =?iso-8859-1?Q?+ktI3ZSMhTIUOm7L9CuCkXOjhfvHMjXlc9ZU7vM7Rx0ds3pUudeW4WMRqR?=
 =?iso-8859-1?Q?mZNw3G7OcsaBC8Umk4Ig7JZg9ZWNxBFV6oH8bEvJ79mumBQPtK7vvlygNP?=
 =?iso-8859-1?Q?CZIinrpSCBsYsrLqU5sb0iqpuHD5YxmAyhXaUj6Op7Ae7fjmdfu/V8u6fk?=
 =?iso-8859-1?Q?JVXByPZlmY5YnL7I/YhY/5ggswIqfDrCLnPSwqTd1PHhErps8gU7siGZE5?=
 =?iso-8859-1?Q?FZgp377Ncse6UrzRXGTR5vA85iYFzRhm1yEhQys/kadbRESu0kSQ+FgpTb?=
 =?iso-8859-1?Q?aI+IMLmGmyUzJz0+yv2vALyfXAZh8VL1dKK2waHrpm5P9/W/aYD2vOs4li?=
 =?iso-8859-1?Q?o001gQ4a0YAYw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9SN6PR1501MB2030_"
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1501MB2030.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caf9232-8a04-4a32-699d-08dab35c5475
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 12:03:56.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDmHLC00cIgCAf5Vm+C96OnDRuJxBtFAO7Uw4VyPHr/VdGzfowfP5beiqjhiKKlYvEW6IBPnztKlQOJgO3Kcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3203
X-Proofpoint-ORIG-GUID: bYH9cwUHd9VCD7vRVSWhVadBbQZ0tUNy
X-Proofpoint-GUID: bYH9cwUHd9VCD7vRVSWhVadBbQZ0tUNy
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=769
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210071
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

--_000_SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9SN6PR1501MB2030_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am planning to deprecate/remove some of the dump plugins as some of the c=
ommands are no longer valid or have been captured as part of other plugins.

Remove altfwprintenv<https://github.com/openbmc/phosphor-debug-collector/bl=
ob/master/tools/dreport.d/plugins.d/altfwprintenv> plugin
This plugin caters to capturing "Alt-Flash: U-Boot environment variables" a=
nd it is applicable to systems that have 2 BMC chips.
https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/drepo=
rt.d/plugins.d/altfwprintenv
pushed the following commit
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52943/21

Consolidating network-related plugins, moving the ipaddr, iplink plugins to=
 network plugin
Removing https://github.com/openbmc/phosphor-debug-collector/blob/master/to=
ols/dreport.d/plugins.d/ipaddr
Removing https://github.com/openbmc/phosphor-debug-collector/blob/master/to=
ols/dreport.d/plugins.d/iplink
adding functionality from above plugins onto network plugin
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/52891/22


Remove https://github.com/openbmc/phosphor-debug-collector/blob/master/tool=
s/dreport.d/plugins.d/servicestatus plugin as it
is a time-consuming operation and as we already have https://github.com/ope=
nbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/faileds=
ervices plugin which
collects failed services details.
https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/53082/13

If anyone has dependencies in automation scripts or has a need for them or =
has any concerns, please respond.

Regards
Devender

[https://opengraph.githubassets.com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855b=
a9a59b2ba1ccb8b64bc5c65ea/openbmc/phosphor-debug-collector]<https://github.=
com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/=
failedservices>
phosphor-debug-collector/failedservices at master =B7 openbmc/phosphor-debu=
g-collector<https://github.com/openbmc/phosphor-debug-collector/blob/master=
/tools/dreport.d/plugins.d/failedservices>
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.
github.com

[https://opengraph.githubassets.com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855b=
a9a59b2ba1ccb8b64bc5c65ea/openbmc/phosphor-debug-collector]<https://github.=
com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/=
servicestatus>
phosphor-debug-collector/servicestatus at master =B7 openbmc/phosphor-debug=
-collector<https://github.com/openbmc/phosphor-debug-collector/blob/master/=
tools/dreport.d/plugins.d/servicestatus>
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.
github.com




--_000_SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9SN6PR1501MB2030_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am planning to deprecate/remove some of the dump plugins as some of the c=
ommands are no longer valid or have been captured as part of other plugins.=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Remove&nbsp;<a href=3D"https://github.com/openbmc/phosphor-debug-collector/=
blob/master/tools/dreport.d/plugins.d/altfwprintenv" style=3D"margin:0px;ba=
ckground-color:rgb(255, 255, 255)" class=3D"ContentPasted2">altfwprintenv</=
a>&nbsp;plugin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: ui-monospace, SFMono-Regul=
ar, &quot;SF Mono&quot;, Menlo, Consolas, &quot;Liberation Mono&quot;, mono=
space; font-size: 12px; background-color: rgb(255, 255, 255); display: inli=
ne !important;" class=3D"ContentPasted1">This plugin caters
 to capturing &quot;Alt-Flash: U-Boot environment variables&quot; and it is=
 applicable to systems that have 2 BMC chips.</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<a href=3D"https://github.com/openbmc/phosphor-debug-collector/blob/master/=
tools/dreport.d/plugins.d/altfwprintenv" id=3D"LPNoLPOWALinkPreview">https:=
//github.com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/p=
lugins.d/altfwprintenv</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3">
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
pushed the following commit<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
52943/21" id=3D"LPlnk118436">https://gerrit.openbmc.org/c/openbmc/phosphor-=
debug-collector/+/52943/21</a><br>
<br>
Consolidating network-related plugins, moving the ipaddr, iplink plugins to=
 network plugin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5">
Removing&nbsp;<a href=3D"https://github.com/openbmc/phosphor-debug-collecto=
r/blob/master/tools/dreport.d/plugins.d/ipaddr" id=3D"LPNoLPOWALinkPreview_=
1">https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/ipaddr</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted6">
Removing&nbsp;<a href=3D"https://github.com/openbmc/phosphor-debug-collecto=
r/blob/master/tools/dreport.d/plugins.d/iplink" id=3D"LPNoLPOWALinkPreview_=
2">https://github.com/openbmc/phosphor-debug-collector/blob/master/tools/dr=
eport.d/plugins.d/iplink</a><br>
adding functionality from above plugins onto network plugin<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted6">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
52891/22" id=3D"LPlnk674315">https://gerrit.openbmc.org/c/openbmc/phosphor-=
debug-collector/+/52891/22</a><br>
<br>
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7">
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_2 _EReadonl=
y_1"></div>
Remove&nbsp;<a href=3D"https://github.com/openbmc/phosphor-debug-collector/=
blob/master/tools/dreport.d/plugins.d/servicestatus" id=3D"LPlnkOWALinkPrev=
iew_3">https://github.com/openbmc/phosphor-debug-collector/blob/master/tool=
s/dreport.d/plugins.d/servicestatus</a>&nbsp;plugin
 as it</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8">
is a time-consuming operation and as we already have&nbsp;<a href=3D"https:=
//github.com/openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/p=
lugins.d/failedservices" id=3D"LPlnkOWALinkPreview_4">https://github.com/op=
enbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/failed=
services</a>&nbsp;plugin
 which</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8 Conten=
tPasted9">
collects failed services details.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8 Conten=
tPasted9">
<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/=
53082/13" id=3D"LPlnk897787">https://gerrit.openbmc.org/c/openbmc/phosphor-=
debug-collector/+/53082/13</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8 Conten=
tPasted9">
<br>
If anyone has dependencies in automation scripts or has a need for them or =
has any concerns, please respond.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8 Conten=
tPasted9">
<br>
Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted3 ContentPasted4 ContentPasted5 ContentPasted7 ContentPasted8 Conten=
tPasted9">
Devender<br>
<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_4 _EReadonl=
y_1">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZGVid=
WctY29sbGVjdG9yL2Jsb2IvbWFzdGVyL3Rvb2xzL2RyZXBvcnQuZC9wbHVnaW5zLmQvZmFpbGVk=
c2VydmljZXM." class=3D"LPBorder143613" style=3D"width: 100%; margin-top: 16=
px; margin-bottom: 16px; position: relative; max-width: 800px; min-width: 4=
24px;">
<table id=3D"LPContainer143613" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td>
<div id=3D"LPImageContainer143613" style=3D"position: relative; margin-righ=
t: 12px; height: 120px; overflow: hidden; width: 240px;">
<a target=3D"_blank" id=3D"LPImageAnchor143613" href=3D"https://github.com/=
openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/fail=
edservices"><img id=3D"LPThumbnailImageId143613" alt=3D"" height=3D"120" wi=
dth=3D"240" style=3D"display: block;" src=3D"https://opengraph.githubassets=
.com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855ba9a59b2ba1ccb8b64bc5c65ea/openb=
mc/phosphor-debug-collector"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle143613" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor143613" href=3D"https://github.com/op=
enbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/failed=
services" style=3D"text-decoration: none; color: var(--themePrimary);">phos=
phor-debug-collector/failedservices at master
 =B7 openbmc/phosphor-debug-collector</a></div>
<div id=3D"LPDescription143613" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: wf_segoe-ui_normal, &quot;Segoe U=
I&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12=
px; margin-right: 8px; overflow: hidden;">
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.</div>
<div id=3D"LPMetadata143613" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: wf_segoe-ui_normal, &quot;Segoe UI&qu=
ot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
github.com</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_3 _EReadonl=
y_1">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZGVid=
WctY29sbGVjdG9yL2Jsb2IvbWFzdGVyL3Rvb2xzL2RyZXBvcnQuZC9wbHVnaW5zLmQvc2Vydmlj=
ZXN0YXR1cw.." class=3D"LPBorder920616" style=3D"width: 100%; margin-top: 16=
px; margin-bottom: 16px; position: relative; max-width: 800px; min-width: 4=
24px;">
<table id=3D"LPContainer920616" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td>
<div id=3D"LPImageContainer920616" style=3D"position: relative; margin-righ=
t: 12px; height: 120px; overflow: hidden; width: 240px;">
<a target=3D"_blank" id=3D"LPImageAnchor920616" href=3D"https://github.com/=
openbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/serv=
icestatus"><img id=3D"LPThumbnailImageId920616" alt=3D"" height=3D"120" wid=
th=3D"240" style=3D"display: block;" src=3D"https://opengraph.githubassets.=
com/ce6c79c9f23b83b25bc9ee5d88dcaf23230855ba9a59b2ba1ccb8b64bc5c65ea/openbm=
c/phosphor-debug-collector"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle920616" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor920616" href=3D"https://github.com/op=
enbmc/phosphor-debug-collector/blob/master/tools/dreport.d/plugins.d/servic=
estatus" style=3D"text-decoration: none; color: var(--themePrimary);">phosp=
hor-debug-collector/servicestatus at master
 =B7 openbmc/phosphor-debug-collector</a></div>
<div id=3D"LPDescription920616" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: wf_segoe-ui_normal, &quot;Segoe U=
I&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12=
px; margin-right: 8px; overflow: hidden;">
Collects debug data from the BMC for extraction. Contribute to openbmc/phos=
phor-debug-collector development by creating an account on GitHub.</div>
<div id=3D"LPMetadata920616" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: wf_segoe-ui_normal, &quot;Segoe UI&qu=
ot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
github.com</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<br>
<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
<br>
</body>
</html>

--_000_SN6PR1501MB2030A4F780F2226BC4C5CDB9FA2D9SN6PR1501MB2030_--
