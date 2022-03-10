Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989494D42B0
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 09:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDj8y2tlqz30Bl
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 19:36:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=D7VuJwqP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=ami.com (client-ip=2a01:111:f400:fe59::620;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=dhineskumare@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256
 header.s=selector1 header.b=D7VuJwqP; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDj8S0lNRz2yQG
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 19:36:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nalGXzLOpRcWNCMvI+AKygzCy31MWYDevCnzRhUkV4ZET3OO2ZeL0g3lghSwFEbgNItlmMXcWJCnkvtTmYgvAHb//6OQXUa9Q0NYP0CfwnjXekuEVE9S3cOkdA+QgNdt+L1+k+Qk383GJve9Zz/iKPALWg6MXhXxHU9cgTqqqd9CnMOIIV4ZmfDPzYmQbOLKFZpQ5mMIVQILRdFHng858u+D7oduiiqeq4foHqXyE4mg7TTfi7vbPnENYvccIYAc3pH+LiVybQIHRrkv90IwP5RllZp5C2foo773xjePMklWiW/nq3crihJka2Fk69ad6lCMTzGuqTrmq10p7s94pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3otEItYVkcLxu+SCTudgazmv63BR8zm4fAyb/e5RwA=;
 b=RMGD/elKSGVPu27fpAQetfm2GkGfbzomPyCReWR29peTj0RVJa5vK6e2QRevIZHh+DbsikSLvD0NGDc6Lec2+2LorB2+G33FESX2b9gqtoIBmehQYdvv0eQ+/LDqMyMw6EjZ9F6zyAdVGOMxLgZOaKrNQGllnbd1zXhP9FgePMW90BjDTGRiDnMuLA241xJjOeAKHXZzUv+lhnSqnazteWWZpWqZw1Bj7YLGPiXj0e8P1AvgV5fpduyZ1uwItGD1m7TfFsySKsds2Ysww4jlzhXm53dEIlhJR1LVh6aBcB8inRb+iim3xAC7N65aj6eCFw2ykUDFDMvSkbfa21AHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3otEItYVkcLxu+SCTudgazmv63BR8zm4fAyb/e5RwA=;
 b=D7VuJwqP13LrHD/1ZCJ8IDRhoOTjtNC/yZlZvr5yCL2y+1aJIuYgHK06lw5z/oeXsvEOTiuYmaaReV+67+Gz/Ojj+d/8tlI0r0o630bMuXfQovIsWxwm1QU8ewiBi5XxEil2/z9tkW4D8JPywD6r4U+J+K86ac032vw3U2q7YQ0=
Received: from CO1PR10MB4804.namprd10.prod.outlook.com (2603:10b6:303:90::5)
 by CH0PR10MB5100.namprd10.prod.outlook.com (2603:10b6:610:df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 08:36:00 +0000
Received: from CO1PR10MB4804.namprd10.prod.outlook.com
 ([fe80::2194:579c:5c88:6a60]) by CO1PR10MB4804.namprd10.prod.outlook.com
 ([fe80::2194:579c:5c88:6a60%3]) with mapi id 15.20.5061.021; Thu, 10 Mar 2022
 08:36:00 +0000
From: Dhines Kumar Eswaran <dhineskumare@ami.com>
To: i.kononenko <i.kononenko@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "ed@tanous.net" <ed@tanous.net>, "jk@ozlabs.org"
 <jk@ozlabs.org>, "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "raviteja28031990@gmail.com" <raviteja28031990@gmail.com>,
 "gmills@us.ibm.com" <gmills@us.ibm.com>
Subject: RE: [EXTERNAL] Re: Feature Enhancement - Virtual Media over HTML5
Thread-Topic: [EXTERNAL] Re: Feature Enhancement - Virtual Media over HTML5
Thread-Index: AdgGDFAwS0aFeOwxRmGCV5dweAX3mQABR34AC5IUssA=
Date: Thu, 10 Mar 2022 08:35:59 +0000
Message-ID: <CO1PR10MB4804EDDEF23C5C0DCF5BBC8FC80B9@CO1PR10MB4804.namprd10.prod.outlook.com>
References: <CO1PR10MB4804435C69CA969461FCCF61C8509@CO1PR10MB4804.namprd10.prod.outlook.com>
 <dddccb48-51aa-b63a-5f7a-9ed16b14fa82@yadro.com>
In-Reply-To: <dddccb48-51aa-b63a-5f7a-9ed16b14fa82@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35636fcc-727f-419f-2fa6-08da02710145
x-ms-traffictypediagnostic: CH0PR10MB5100:EE_
x-microsoft-antispam-prvs: <CH0PR10MB5100964D239036AE04C9B2CDC80B9@CH0PR10MB5100.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ll0/BpIjuXIRebeSWi4aZkSA+32DWY325/OtQc4jCI48382nnwPRD8CY3Ie9MlKweWu6yEpOKmRFgwABXGtlkq8PJKYdelPKws58r7GoeizTcKkHZ1lNRuhIw5viakdsxumLpFP15UVrAvN7aq1N/gh7fTTEzsfilg55iGCXAUBumbd5pg+MFT+8+jI/qFzC57F08eo4Qo8aYkQce9JPFIaPgIOqhry2bnyerbpED8fn/IGfyHIsDFjJ/c0jhb0Xl7BhS9sL9kXgDWn9cWT8sZXDmrhadNTMXL9isb0xq/SWjVA3kY7Nu3lNDF5XnUIIIwiPwSRBoW+OokDdLm9Qh5OlJyelMmhzurIrOCQ77LoJHptJ8lFqBvKiMiK7ci1Pvg2bw4uE8aR2rMTYvmpcLNYqn4V7FJt84y2jEFp+b27WS3FSGfWCiISSivDyzo7DZJ7IHm8IgdUrYrmtDu3vUSi/Z3a270L7qhIYXyqyNrxneRdKAwvu11WY7DQE2pa+/psrBPIKsFzZ2YJKDB0el87KprNSgyF2oW2ReXdKQ4+A8rGVX6vgaFsSXp0DzfMpn9BKoZHdd2rIu5/6Flsku2cPIkdq2eCGXosHj7if4d4xU7XVuUIfz0YJOoe7N3ds2nLLn7rYY+qT65ORYWQS4zxXqOm+uD7aQzE0ZfW+8Q220gPzqV1AyoJTlBM/vxj3lf8n1kseuqyCue2al9wTW2M4E5/fr5Erk5b/U7ZkUd1mBCy77//9JqDvOQfrmBSoqIwnXQ0htbTdeVL5OExUuEnulDgAgzWf7M2udewdUgU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4804.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(76116006)(4326008)(66556008)(508600001)(38070700005)(66446008)(66476007)(64756008)(8676002)(55016003)(122000001)(966005)(52536014)(55236004)(5660300002)(8936002)(6506007)(7696005)(53546011)(71200400001)(26005)(86362001)(186003)(316002)(2906002)(38100700002)(9686003)(40140700001)(110136005)(33656002)(54906003)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9P4BTaJq7IfpA7YBOwNPQxbN1/huKd761Uxkfl5o/ObS6KQfecqV4vZ9qgY+?=
 =?us-ascii?Q?zF83OpWBpW8IX+dCmo6Ij63zbhIQJgLmqnUTDWOhCMJrViUbB9qSElp7AZj+?=
 =?us-ascii?Q?Mz00hPM5aojayMIEbNoXHSq1+AIBqza0vhuLajGQeEUqorYj/nPNaBh0/QMQ?=
 =?us-ascii?Q?ZbN6k553ScfB3rnsgEOInpbpi5/iI0NNJiATWAY0iyThdnx1Ej6PU6rkvoVA?=
 =?us-ascii?Q?n1CUl1ZkdTj2OCwR3Ge8CxzqhsDEpXtofaOq/IyRswOGKy98DUfQTWiq4MMA?=
 =?us-ascii?Q?uDaxqQ5ZgR7yiBQKqrnaoOV819ezMtr6EvR6ugulAthxutSJ59BF7LjIx+HL?=
 =?us-ascii?Q?rSq2E14Fyu0+1HbBcS5q7yuk8Ryi/eUebJsDZ1wy59E6ShVWIZzwd2ptW9cL?=
 =?us-ascii?Q?N3i/TnOW8M9XkwS51QhJ8n4oZ4Ip2U/wKHzUjUZCn0Hpd1ZAiEpYHspQNllj?=
 =?us-ascii?Q?hCKmf5sMCXSCI8NZPov6fkpiMrKdVJHTQk9yoLF00B+0L/BTFQjSMv1O9vW3?=
 =?us-ascii?Q?qnO6Hqhotbc7CHJ1f8uVsvg5LQvYe63Y8LmeTVUpODzC24beyiHKqamK+29H?=
 =?us-ascii?Q?BJvDzXL59AsWQvpSp10eQDS+h8BiflhS6OxMfhoXftzdbNQx9z9IhTWpILtW?=
 =?us-ascii?Q?W8jAqHJpTyaL8xc2Z4i8t04DUY/eH/6WQFTtb8XoKazYqHlkrSQQiEMrnG9D?=
 =?us-ascii?Q?ZQf39cSAf3fUMtSvC+ux1sLHVFrI6V2VdbZe5Q8MTRQommU/pPb0grig+ZIA?=
 =?us-ascii?Q?SeZRUS1+8ZwqGoxmbx/XNXbcvjZiH6Wm8HqX0Ce9Qyq2uNk0K6Wh/XzxyPio?=
 =?us-ascii?Q?beJ9HqFA1ZbLahYlviQqdPT8iGrdZ3o2mWTgmpJr50GDacwApcNuNAvnGtDN?=
 =?us-ascii?Q?N8Afwhxc2SXZWjKalUAxq9yy4DnXflYYIt+1mG6h9k1enBQ3DXEbp9fP6K8V?=
 =?us-ascii?Q?+lMpYz7fZ8p0euUvUF+NJmlb/7nPPlow47qSBLaYw8DHVPevMUephrq6s7cD?=
 =?us-ascii?Q?M/Y8ckem/94lfRHgIa1I49DvzLMus8hlvC6DHvT/Yw92NFLHlFLrG5Cqjaa7?=
 =?us-ascii?Q?QGBBNW4dxx79sDaBceLKS4IHH5v06PCJE+/VzEDZDbnF5wPtmWsLJzh5C30I?=
 =?us-ascii?Q?WDx9cVkJ02Lb2LdBAFADHb4q+gKwDkl9C9BYAuv1RkaNSWkCYVXO8ryHIoFR?=
 =?us-ascii?Q?T7UN6KgSMghNGsI0Kpzr83bPrjZqq4tJcB6PPrxHYVj7IX/BfWEqDMTh+pA5?=
 =?us-ascii?Q?9Pm4EBOe/aeQpTCpWQnWBHR1QHJ+HaPzfubCV5gehG46UuCA/sYlWMwylPqp?=
 =?us-ascii?Q?XcySQtPjX2khBgOtLsNvuWtKClRu+oV/FeJMMuBZG6nbWJhVamYhkO2DweTZ?=
 =?us-ascii?Q?5iXIv4LSvYGVq1uudDmKa+6bLEpPsOSkCMJ1cu1eh2CeQS5E/apFJx3jnrXU?=
 =?us-ascii?Q?d8U3XeDvVvCR9IgqbHOX9dFqGnv/5EX2foBxHzu208NhB68WAWrqUvKIFZtA?=
 =?us-ascii?Q?8ZvDZXNrWlX1Hbg4UMo7+fibYav7SW4NVjCJfmkpkujf2tOfRg6/37pSuN67?=
 =?us-ascii?Q?6q8g20Bw92kkKxiSC75wqaR39IyEJ8wUX6MRfAUWmqW+NoP60J3Vff4Jrd90?=
 =?us-ascii?Q?Bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4804.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35636fcc-727f-419f-2fa6-08da02710145
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 08:36:00.0343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJWvpQOafk9BXIz5QhVnHGobgm+Sq3pRGRDTUYA8ypzPfcFypS6yayYVJKnH+XSmv+mYPO/xE7hAN0LuvIv2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5100
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
Cc: Gayatri  L <gayathril@ami.com>, Pravinash Jeyapaul <pravinashj@ami.com>,
 Sanjay Ahuja <SanjayA@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

We wanted to know the status of this new design of jsnbd, please let us kno=
w if the community is going with this new design or the existing implementa=
tion of virtual media.

We are planning to add support for multiple instances of vmedia redirection=
 concurrently from a single client , based on the response for above we wou=
ld wait for the merge for new design or proceed with our design in the exis=
ting implementation.

Thanks.
Dinesh E

-----Original Message-----
From: i.kononenko <i.kononenko@yadro.com>
Sent: 10 January 2022 16:32
To: Dhines Kumar Eswaran <dhineskumare@ami.com>; openbmc@lists.ozlabs.org; =
ed@tanous.net; jk@ozlabs.org; geissonator@yahoo.com; raviteja28031990@gmail=
.com; gmills@us.ibm.com
Cc: Gayatri L <gayathril@ami.com>; Pravinash Jeyapaul <pravinashj@ami.com>;=
 Sanjay Ahuja <SanjayA@ami.com>
Subject: [EXTERNAL] Re: Feature Enhancement - Virtual Media over HTML5


**CAUTION: The e-mail below is from an external source. Please exercise cau=
tion before opening attachments, clicking links, or following guidance.**

On 10.01.2022 13:25, Dhines Kumar Eswaran wrote:
> Hi All,
>
> We are planning to support multiple Virtual media redirection support sim=
ultaneously.
> The below is the proposed design.
>

Do you already saw the current work upon redesigning the jsnbd? What backen=
d you are want to use?
The current progress of the nbd-proxy(jsnbd) might conflict with your desig=
n if it is based on the current nbd-proxy.
Please, refer to the appropriate gerrit change (1).

> Existing Virtual media implementation:
>
> WebUI is having single browse slot. It is used to redirect any kind of me=
dia, which can be either CD or HDD media instance.
> It is mapped with "/vm/0/0" API endpoint, and media endpoint is hardcoded=
 to 0(Zero).
>
> Virtual media is using "/dev/nbd0" device, and Dump offload is using "/de=
v/nbd1" device. It is parsing from the jsnbd configuration file.
>
> Enhancement: Multiple simultaneous media redirections feature in single W=
ebUI session.
>
> WebUI will have two different browse slots to select the file, (i.e., ) V=
irtual media device - HDD and Virtual media device - CD. Both slots will su=
pport media redirection concurrently.
>

We already have worked in the past to make able configure virtual-media dev=
ice type by client request. E.g. in the usb-ctrl, we have a flag to specify=
 whether USB, USB-RO, HDD, CD(DVD) VM-type.
Is it really required to have separate VM-endpoints for the CD and HDD type=
s?

> Virtual media device - HDD slot is mapped through "/vm/0/0" API endpoint =
and media endpoint is 0(zero) which is used for initiating the proxy handle=
r, which is present in bmcweb package.
> HDD slot will use "/dev/nbd0" device for HDD media instance redirection.
>
> Virtual media device - CD slot is mapped through "/vm/0/1" API endpoint a=
nd media endpoint is 1(one) which is used for initiating the proxy handler,=
 which is present in bmcweb package.
> CD slot will use "/dev/nbd1" device for CD media instance redirection.
>
> Dump offload will use "/dev/nbd2" device. It is also parsing the nbd devi=
ce from jsnbd configuration file.
>
> Configuration file looks like,
> [cid:image001.jpg@01D80639.FCBD3330]
>
> This is an extension with what the community has implemented and I hope, =
it does not have any regression or conflict with others who are using virtu=
al media and nbd devices.
> Please help to review the proposed implementation, so that, I can go ahea=
d with implementing the enhancement.
>
> Thanks,
> Dinesh E
>
>
>
> -The information contained in this message may be confidential and propri=
etary to American Megatrends (AMI). This communication is intended to be re=
ad only by the individual or entity to whom it is addressed or by their des=
ignee. If the reader of this message is not the intended recipient, you are=
 on notice that any distribution of this message, in any form, is strictly =
prohibited. Please promptly notify the sender by reply e-mail or by telepho=
ne at 770-246-8600, and then delete or destroy all copies of the transmissi=
on.
>


Links:
[1] - https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
errit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fjsnbd%2F%2B%2F49944&amp;data=3D04=
%7C01%7Cdhineskumare%40ami.com%7C94792fcf27594faf5ab908d9d428921a%7C27e9785=
7e15f486cb58e86c2b3040f93%7C1%7C0%7C637774093002801627%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00&amp;sdata=3DzZ0xayUmcqKc1fTeD6FhCq%2FJ1l9h%2Bps3sE6rDRKIC5M%3D&amp;reser=
ved=3D0

--
Best regards,

Igor Kononenko
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at 770-246-8600, and then delete or destroy all copies of the transmission=
.
