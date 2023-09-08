Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D779835F
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 09:45:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CVtR3Zg3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rhp743kTbz3c92
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 17:45:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CVtR3Zg3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhp6Q5d11z2x9T
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 17:44:46 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3887KoYm002111
	for <openbmc@lists.ozlabs.org>; Fri, 8 Sep 2023 07:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pp1;
 bh=JiPqPHK/2woCs/6/PtWpzEnHxZcDBDubo+jv8tvh4K4=;
 b=CVtR3Zg3igrZLhYUtWPyheJS6SY8T44vGmNZGrQbVJ4Tcpr5DNBb525G53kIzcKqumEU
 YdWxjGffDoxkkiGrI2WXr6kM51WBsv0J3HwvWW5w8PIU99fqfoW6MH4BuXlFiyJG0P4n
 YqjBH90Ht6BDSlCBFPuvjbxGoe5uSKAYUp/t3yTzRPfl3Up+PLVavzGzG4SYTMQrOn8e
 CtV+SJCXo2sud6LZ/VGzFsKzPN9+b5mnVTlfOx7BAjvoF6XOw2AqW0D1+Vyn8vWIsB6l
 ss3UfRFmJvbSZTgL1462k1SPFvMiZWOR0R1+FSua+cDePlcoFhIeD2ERSiUIdT86RxsU Jw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syw10ucyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2023 07:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWPT3OZpkTD36UFS4gPcH05aY8y9U7oLnWWsOpyb28eQK1AzP4tNKCB1W8G7wm3KHf+9ecCW1O/XwkKlPr6WN4iKbJcYQ4CB/ck1AxI0jeyR1S9e/uek16bRmZ8gyLGc9S5LHC2iuAHw79iwb+bUoDmu6XDfHlsHnuX40QVsjpNEMGPzDjYYf+lbry1pWGeYlGcOWFTxfhoDOVXzqAWzCdi1CDSW780sCFxU9FUccA6xNMCufKOCpZKrAFhqMzUPd3IGWgGUzK8gX4Av6zK7IrsD0VQrAr8RvgBbioIgNOyUyMrOOU2tBZEIWUpYwb1MlOLvQi2pK9iGQ9ruXy40BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiPqPHK/2woCs/6/PtWpzEnHxZcDBDubo+jv8tvh4K4=;
 b=CqzHAcVJhrjW5LaHpVPpW1ohl04PiQGJt7mB2oF8ykttgXsnqyyHz1TBgj6iIeOdUcZManAV7bzVYTTXvLZwLJzzp45Jd/3n9JGTknPSA7/2ked+PWJjzjCZ6UfnrYAf9M4AufX1A7B1JQyK8oJ+lNwu/lig33EdT1Xx94/ihF7mEM8ORT+ZfSfOv7yTNRJx4mttASwE0u/7M90YQe7OPwupxbl9Ehz758gI1u6LNW8cig+Q6d51uUhaOcOMpjyHsY4WThXRlJo11RW9GmCiuHgZ+FLEWGTKRWFv4A9b6t7m8z3GWHFZYpuaKXfXc1G2rtma1W906aEaMiqgHUimSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from DM6PR15MB3676.namprd15.prod.outlook.com (2603:10b6:5:1f7::20)
 by SA0PR15MB3933.namprd15.prod.outlook.com (2603:10b6:806:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 07:44:41 +0000
Received: from DM6PR15MB3676.namprd15.prod.outlook.com
 ([fe80::5cf7:a224:52e8:79b8]) by DM6PR15MB3676.namprd15.prod.outlook.com
 ([fe80::5cf7:a224:52e8:79b8%5]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 07:44:41 +0000
From: GEORGE KEISHING <gkeishin@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBmc Test Repository:  Legacy REST support sunset Year end
Thread-Topic: OpenBmc Test Repository:  Legacy REST support sunset Year end
Thread-Index: AdniJVZAnGe+48ApQ3yqVRGUGUfHMw==
Date: Fri, 8 Sep 2023 07:44:41 +0000
Message-ID:  <DM6PR15MB3676185D31E6DA488FA02ED5E6EDA@DM6PR15MB3676.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR15MB3676:EE_|SA0PR15MB3933:EE_
x-ms-office365-filtering-correlation-id: 13eb0bd7-eddf-41f5-c3e4-08dbb03f7637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QvPDnrqrRFHg75dpFeg3v5AyN6T5bdJ2o/s+dPjkX48A61MVisQ9eCL1FbLhT+PCV3CHgfQFPwQmlXlFgzfyPZUSg4t34JK+Cdgy81pBq2KLlsiwA/6BNCV+0TFUW9TD1+HkjC1M298EaZrAtXkeGet2VLisUVJ2Zx3c4/ln99RxITRrdAQVDz/DWKKYoQIArqla9T1YzG2c3Fv591dbBUydR4O6UUpjwHZXSQN+zQKgW+LPDLLrbJ0hw+ndyA3f6CC/44WkHYdBkcdfacd0zypGPfBevJqBs3vXMarVHOFvarpNmqsGKF6w68KwRCDqnZ3GRYR1HbL8VEZNgTxVyXzPMd5ypmBm4k/QoNzn73/hk1LQcnvWkzQ3FWEeGlRlJ38iktrYu63XmgmSmD1IAi3DEE+J1gB8L34JVbE/U7/q/Us9f+Wcz5TLA++4V7EZDdEq4oDxodVm1LmzDILGVTfKRJNchp9sJKLSajxSi55CbA5osxqF44DeH0B3NRX9NttCMqt6VNKkigi8Ps2RRKv5AMPd+weOcPYDdojlbbazgsM5VB9isRJkEbTWtYLzXeuLOi2vINvAVoW7cM+IuukdP0y4lNlBYBzIMV2TzHOOyB29hF5cjDFd7ElBs/+z
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB3676.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199024)(1800799009)(186009)(66476007)(6916009)(64756008)(316002)(66446008)(122000001)(33656002)(9326002)(71200400001)(86362001)(76116006)(2906002)(66946007)(66556008)(41300700001)(8936002)(8676002)(52536014)(4744005)(5660300002)(55016003)(478600001)(38100700002)(38070700005)(9686003)(6506007)(7696005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?7p6Ch0xj/3M5CxEgS9liCyZ+9lYbe6dIw2e9M2ZDMOXPmGpNdrtkQHrymxV/?=
 =?us-ascii?Q?isbFEiCoE90GANfIh6gdZvwSF+uQ2h+txP6clhYih9wx9uvIWg5gTjgYnrIo?=
 =?us-ascii?Q?royni/15c+OJcjwyty713qJn8mfs+R0R7pZG3ikS28ecZbo7p+JwhHUzLQzw?=
 =?us-ascii?Q?rqTgZriCU3Qa/FVgGvjbIg4y5j2XpG8RaXSPoAf9XOBZ+rgbaLPo3vjNW28D?=
 =?us-ascii?Q?MTg1xNR57ZS5ChyP91qIkaA0WBovNCAQCHH5k9SAon3p4oFx+uaGb4WTH1M8?=
 =?us-ascii?Q?t5+dKIb1bQdIDJsKxlpCq6i/kuHI5GTkbTjD4Zwf/s3otSDzfBD9f/7w0F6z?=
 =?us-ascii?Q?EbNIxVmm9pUYk/WG3S/lVreaK0rMOfUT/JdVh+xhBKBimdd9La1/GAjQaCE0?=
 =?us-ascii?Q?d6BITJss45WXFlCFZt1OR/buONgQcsKlPW9hpBapUJD0GRRk9hTt3rkOLSom?=
 =?us-ascii?Q?OvQpZEDQ0zK5fW0xR0gk5qAH7QdhqWYb8GNUX3BRq/mCJC5xlEu+/aeLosrk?=
 =?us-ascii?Q?jKqkavrOstymImyhX/NXE8tfxf9vG9MJC6dckX3V+O6jCdGkWgE/jjOSdWrz?=
 =?us-ascii?Q?0MZ3zIYZg7HptuQjSoM2ebAcz6IAS9rYKi+eBpHnddyn5WT5wjvo7XISauyS?=
 =?us-ascii?Q?6LmfSbnXAaeLF+kYWUo3rYYB3G6fi6jL5PPwMpn5/1iDe847ESf+pzNImMri?=
 =?us-ascii?Q?85yGcSQVGdLArEnhyWAFf6y3VjYRC2oxiNeASRdZ+fVrFMuQ2pivSXdZmlHb?=
 =?us-ascii?Q?JsjQwcBrfSHV760rhl7Ekvio+N/n/ZNAQ2a8XpZNPlGlSTV38pctGIbUWPrj?=
 =?us-ascii?Q?bzdGHxJWvD6uyPC8iN64rwGZ379oeJR6jq+hUMaMnAEXKs5nAfs+1PzlXCdA?=
 =?us-ascii?Q?sIKTtJwXy+PqPjWxSSi1CT162J97q70QsHjtzdixLgjdmW6vMdqx7CP5/5/u?=
 =?us-ascii?Q?FA/lY3P7xaaxj/opdna0MywgzF4u/74+wOiWRWFi/n800V/5kt1jU5ySsndS?=
 =?us-ascii?Q?D6Yjhjx0xdLpUb86mCCyK2JtcB2xkWdab7BUe0iyu9n09LNHexbTQy3u7ANP?=
 =?us-ascii?Q?p6I1NUOzdhm9uz3UDN8PPt0q8MEYY1A+dxBQtkIUvuvyqPTfW4CP0Lz7VIHk?=
 =?us-ascii?Q?sGWMSjP0qXi3RS5ochPr33f7jP5fjkPLDBNzxFZHE6JPXv+UyCGldO6itOzU?=
 =?us-ascii?Q?DJkVvB66SeASM+Bsx+RPLIEIJO6adzKdIjFR5ipux8/vUxa/3xKC+en8QTm8?=
 =?us-ascii?Q?jRGqf9wJcaxdUXyvOYxnhzU6Mr+ptJXsQ1NWZDS0RYgQKPG4emWY3SuSAbb8?=
 =?us-ascii?Q?zE6eVsyqGIvj62Jm01NEBxccwaaCqtTsSwUyPan6Lfv31Hd+UyJC7/ePhYL/?=
 =?us-ascii?Q?9ida0xzvkA4xaAylI5q9Em4g4Em3qU0M4nR4Y6zrAjE5KCMw9NnPWO3J4Gvf?=
 =?us-ascii?Q?DC+4Th/2BHnMoUgERa7xHUXEXo5qYRefp9zH7ViFIIW0+Eg/YMQ3cK0YfUI9?=
 =?us-ascii?Q?bvkz6Q2bAtqnF0MJ6F2AEHVzJYVkZSO56bb1W0eUPVmknFsXeVewryi1Y8RC?=
 =?us-ascii?Q?NRDdb7nuXWmOdi3TUS+8JMWb5OnH5lfA3gv9MTOQ6EafXbJgJQKHqpQMm9en?=
 =?us-ascii?Q?RDRLhVxEg6LeQv6SVM1iCZ303UcV6/1GQCv9sYzPBbj4?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR15MB3676185D31E6DA488FA02ED5E6EDADM6PR15MB3676namp_"
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB3676.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13eb0bd7-eddf-41f5-c3e4-08dbb03f7637
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 07:44:41.5269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpI8T7YrQ4aPdm34LxgPbeUrbqm0rnAiSoPz4se93cPqhn0xvRUgMJniIwf3KAt4fkWCLqbaxb2NGRA0KW4NmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3933
X-Proofpoint-GUID: 3xJivjg9Yl14c9xxc_--dys9XQXq9HC_
X-Proofpoint-ORIG-GUID: 3xJivjg9Yl14c9xxc_--dys9XQXq9HC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_04,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=929 adultscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309080069
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

--_000_DM6PR15MB3676185D31E6DA488FA02ED5E6EDADM6PR15MB3676namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

               We are deprecating legacy REST test codes and to discontinue=
 tools used in OpenBMC test this year end. We will branch out as a checkpoi=
nt if any users still want to use it in their environment.

               Post we branch out; we will start scrubbing off test code an=
d some significant changes in the test layout and consolidate overall the t=
est repository.

               Thank you for your support, feedbacks, and contribution to t=
he test.

Regards
George Keishing


--_000_DM6PR15MB3676185D31E6DA488FA02ED5E6EDADM6PR15MB3676namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We are deprecating le=
gacy REST test codes and to discontinue tools used in OpenBMC test this yea=
r end. We will branch out as a checkpoint if any users still want to use it=
 in their environment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Post we branch out; w=
e will start scrubbing off test code and some significant changes in the te=
st layout and consolidate overall the test repository.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thank you for your su=
pport, feedbacks, and contribution to the test. &nbsp;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">George Keishing<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_DM6PR15MB3676185D31E6DA488FA02ED5E6EDADM6PR15MB3676namp_--
