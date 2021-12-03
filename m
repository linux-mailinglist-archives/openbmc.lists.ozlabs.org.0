Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CD4670E4
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 04:51:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4zPv3RyZz2ywt
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 14:50:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=j0hmlzwb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=3971fe83cf=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=j0hmlzwb; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4zPP2rDqz2ybB
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 14:50:28 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B31tn6v026198;
 Fri, 3 Dec 2021 03:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=vgw+0p//xKndzAQNRbCfLeedy4X3OAuzi5HEt5DTCj8=;
 b=j0hmlzwbmPxJixaVczYw60PotjBNSQl/BS+xkAOP82P7HrNCS/kfuAaZiI1Mc6JQF/Jf
 BJVpoxh+Wa49blRzo7ntlfOyUgaK/GNYCqRkZOIjnBJu9hKPRE30dmw5d4bxz9OUEwzr
 N51QwVQJE58109406QSbTAvXxElObAu2N8xXcth4RNFILdh3Y9/sGtBUQTniu2H8h5Ll
 f0Mx/I9/t6w2gBAy/SBC5B/LFU1j8NcT0tvNei+w2AknwHeqSpiVaV4uMdZy4/Tt2PEh
 uXwVaXQSWKCRW41UioT+/O3dzRZo97GJgUUCdwGM/txooztVoAOdonvANmyJv9a0Qrkj Hg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3cq5hdsc1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 03:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExEMaWayLAhrSZdhI5D8FQTxNwDMaLXVaAU/h8Eo+4JIDBzuZruegnDXKA3e2v+J4YSDng7qKYjga6zru6I2c+DwSyBTMORGyUX7NJxTrITHY/9E/SFUR78l0NQw72cenV7sagZH6paBBoQOnFVhZT/DruSvqrPsaKEhjib6uuLqliPe/L2PUiXHvqyI7JVl0N0a+5hnuos0kGWBP30uKfXfOJFgTQl5Qivx43czkziFplgyt79LIn6Z7Hx9oWk3hJNg8w0Xu4ninoVdfYEzaF2DVoUWEhOugL9AAn6LsWv7in4jf5LMRrZMqpC0vz2nESwL2UCh9rpPDAzzcbwzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgw+0p//xKndzAQNRbCfLeedy4X3OAuzi5HEt5DTCj8=;
 b=Ceaigci465C80kd/kcsmUv26nsNIPh3Anov1yDTwGdX9+o0qtBpEBLlTMBY1JwQOOhXnGwVIXFwfFtw1sk754Ik+5h5Po74zqjd5Dbhr7vGM4OR6u2nxqbjdVH4HdH2WdJlRJOK/QjVcTu6h2zDc/kD9/J92ZXkVdjY7N5+VRojE3zMKhoL74hcrJIlOy/xGy/ln7V8ktO0KXwji3nGXOnBzWCpPxV2aNupEbvydX+f5urenBxWP400aXHt+ICuu0CHK8qVZ6l8peGl5wgjPbTYrFpcMKzUHvGTyrRhDMCyvzuhjE3JtZtbW7ayl2YSVEw0yrLWrVEz2Pnu6CDY6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by CH0PR04MB8114.namprd04.prod.outlook.com (2603:10b6:610:f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 03:50:19 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::acfe:d8c4:2c80:ca52]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::acfe:d8c4:2c80:ca52%6]) with mapi id 15.20.4755.015; Fri, 3 Dec 2021
 03:50:19 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
Thread-Topic: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
Thread-Index: AQHX5/jkn+X7ymNlTEuFeSmLOaIf9g==
Date: Fri, 3 Dec 2021 03:50:19 +0000
Message-ID: <20211203035019.GC25091@packtop>
References: <20211201072902.127542-1-joel@jms.id.au>
 <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
 <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
In-Reply-To: <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70f05a64-5afb-4415-7794-08d9b61006aa
x-ms-traffictypediagnostic: CH0PR04MB8114:
x-microsoft-antispam-prvs: <CH0PR04MB81140AA2B92770CD834C0F7FC36A9@CH0PR04MB8114.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UKC2tFkkgmbigODmfMhTYEd0Az0Qk4WBtMS0R8TE6D6oydBzASnLYszlwIG5BjBJluPcJk/2qHJWBgPaq54FC57Ksc/Eic1fj9bHkKUCX1BQ0hrArnQO2LZtMOJgQgBdI3DFkG9knK5CzWtzxcRVrlhGvQ3vhGJRkuPRiJ0uieDXk9Utir8LbRNHt8rqCIrtwwoi20JD/avbddLlufMrt0x8snEuryFzXOGWXiX/C4zY/KkUXNkOx3srq6WLZmi/WAMU4XDS+9KA3VKgVSXPHWtT5m/PC/fpuJYAI98joPc2lVnICELqfzOjeZAXzD5vKmDJ7K+by89JyAOATu/kz8w3Ahmg6EAZhrOE8/2zPtRd+OMZIEeFoufdrOUEdumELMngCbH965yf1Jh9ts6Nc2/Wcvcqttrs66p00rh1li6hcng8PSPA1h3dIZC7DBZ/hAkfT0N9LE8HIAL402qCEiC3XW5Xss2xOIopl8QbXTTi8mr6SvOgfMxXgh70rkOgMq6Hc49C5IiUMp4G1WztKdehhVw5tHR0OfVMJyxC/gAJjVlbjSFGXS80qqpGNAqtiPVayEPgKiULaDl0BddL+uwYvOcjkVnJZ7D4rH74PfVPsUQ5Dk4sjJ/oJ7SUVchXhEZqkQILachHIZV7yTIqJVsC4Usewkg/Dz32qfAP0Gr3M5hSRAgmBjuNT6kJ1HLi21vk7DTL09ZdDumodrsR+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(186003)(26005)(1076003)(71200400001)(76116006)(91956017)(33656002)(8936002)(508600001)(316002)(6486002)(38070700005)(4326008)(66446008)(64756008)(86362001)(66556008)(66946007)(6916009)(66476007)(53546011)(122000001)(38100700002)(33716001)(6506007)(54906003)(6512007)(9686003)(5660300002)(83380400001)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aMr3Pu2p51lZIy0CDxPfFCqf5yIl+XgjIWwhZG0+4BkMEZY/X8njI1LONUQI?=
 =?us-ascii?Q?XuGgI7K6Kpg2GqGppnWcNzQXGm7xIpHEuJGrFNLJV7t/+y2o6fsIjMj/jTyi?=
 =?us-ascii?Q?HFgJxdMfEanFdHlv/5aUJZFcnJKsuxs1EvAYvOzmTd3M5MJ1xAY7crYiivod?=
 =?us-ascii?Q?mjgSYzrBTgju5oiSIphR+sLDVZ0LbZDBPr6D0zMiEPwJrqGJLPqQQsAweL2R?=
 =?us-ascii?Q?FJ5LZBaoBt7DqWHMI06K6H5J9amImNJEDUJuFA4F7EeS8SJI3GoWIPrbahDh?=
 =?us-ascii?Q?7kenKrXPXo7dnQXHyhIR2zmPxnMcmf9O4j5Ik+gSg8O9+Ypd6gUKV4AhnuPm?=
 =?us-ascii?Q?2EjdHDdRB2tf+Nqov7PdiAn8Lh5odSPl+DqBxBSnBQtQqUWGZi9eSd1yI5s9?=
 =?us-ascii?Q?lXBFuGincmU6w5UCutWuPgOVCiXo76FgTPuOgl3Z4IYTKwkDXoGPU2jonY/b?=
 =?us-ascii?Q?bg8FxA8BvZXejjoBTNJEBNaHqGwpMn7VJ6BVsO5kIAEW+e5qPpIQkF8NA7hG?=
 =?us-ascii?Q?IrSObKXAWEuMG7Ww8F79uIVOYnVwHxV6Rphc7xjKFf8n1N7HXJN6mG8UcStc?=
 =?us-ascii?Q?QqmzmtPtupHANG0jspoNSTFE2tqW7tmiKUnpRjsWc/5u5adR46r+BWwIZ33/?=
 =?us-ascii?Q?VZaj0vmeffeCG/fyexcaOV+uLOGgF6qNE5qQxxGoq6t/Rm3H2xdEFBoo/Hih?=
 =?us-ascii?Q?dK3EGcKkPEpzq+/KyhUHQ4U6Ln34AU+Mq/3hfke4cKCmy10oAYvedL5ekkzH?=
 =?us-ascii?Q?nM4l4WU7p0A7EBUKAV/jphL8jQ7ivw+KnnhZaz65NO7ixZAlzglXw9aqvqz7?=
 =?us-ascii?Q?pmH+NCfn6TpWNj9DPwCWmH1utuf7X/WT9xHvMCI1jegBY28U8olDcSxGAYV/?=
 =?us-ascii?Q?VI9erRZzD+Oxp21qBHKdmNTR8EdQU/zW0ZNYc2pmB1RV+0SX/qaAWYDcwciT?=
 =?us-ascii?Q?5dMn9XPvjJnK/8GL+qgHKy5Q0QlDPQ8xmAaOTcAH/MrHqyg9wz3HAkbb/Duw?=
 =?us-ascii?Q?ctJjSkdGVIngUwxdGlZosygHY1oNEg7rfsynML8zMyWCSUI7HDgM3cm4uWV0?=
 =?us-ascii?Q?BPsNM93rRclZQ2W2VVKblmq8NazyI3v0vD/yBsEmsDYIeApeRdwAc+14C5Ue?=
 =?us-ascii?Q?CzvpxkEYHX1wu1LiJXThNbmTgtJpta4HDAl+Qqw74/16FdX1I873Q7Dsbomi?=
 =?us-ascii?Q?IMluSLkRaZA0DPw8Gi86DbLeNGtmpMPKoCDzMelHo2joYhiHuXgiGPqJPIqR?=
 =?us-ascii?Q?SVu5ITqW2XNxSHL+sVIABJetDoCxiCSRxmc2m2ZP0UVXZlmHox8MNqG6QjuM?=
 =?us-ascii?Q?IoNxafVK0ILqpgIsFjrUXYAaIbKG4uzyoClRV7XTGSpTlli5GdVxg/m1a4eX?=
 =?us-ascii?Q?opslBJ0hex8mexfiTlERUHcxyt9xSZamo/p5R9XX0CUZuV62C6yHtWOTmL3d?=
 =?us-ascii?Q?GcC0bgQncBAZTxJ5S66BsEsvi8ec2uTR9hDGkiXCG0ILW5lGIVL/uDy2m86W?=
 =?us-ascii?Q?auFvX+HT582kjmI1tD0d25x/nm/4fbzjcHo2c17nP9sG+8fK8MCDpAJNKwnf?=
 =?us-ascii?Q?PBmbLwj25S5goVxHe3iPmTFPvQcI0/5WnOEi4sc8NAM7BqMxZBT7UvgySAlY?=
 =?us-ascii?Q?uGfFlAUUPHd2P5ltPyXiPQM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <99AA0A9D8A9BB5449413DB20E6FB05C8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f05a64-5afb-4415-7794-08d9b61006aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 03:50:19.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hyC4VdtHNqAmrJOSPrxMsYR4GdgcghRq6knhGs9yBk2i7HabYTPL7ZtKUHjbwacSRWXZFhsnYN9vqqU20V9Orw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8114
X-Proofpoint-ORIG-GUID: B8MugjE2RX3VU-Z_Lm-YOQHjAnzktbQY
X-Proofpoint-GUID: B8MugjE2RX3VU-Z_Lm-YOQHjAnzktbQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_02,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030022
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 01, 2021 at 08:29:47PM PST, Joel Stanley wrote:
>On Wed, 1 Dec 2021 at 08:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
>> >
>> > Systems provide line names to make using GPIOs easier for userspace. U=
se
>> > this feature to make the tools user friendly by adding the ability to
>> > show the state of a named line.
>> >
>> >  $ gpioget --line-name power-chassis-good
>> >  1
>> >
>> >  $ gpioget -L pcieslot-power
>> >  0
>
>> I'm not very convinced to be honest. It's not like "gpioget gpiochip0
>> `gpiofind gpiochip0 line-name`" requires much more typing than
>> "gpioget gpiochip --line-name=3Dname".
>
>I'm taking on feedback from people working in our labs, and
>implementing userspace applications. We've been building BMCs with
>mainline Linux for about six years now, and it's been a long road
>re-training them from "back in the day we just did devmem <this>
><that>" and "why can't we just do cat /sys/class/gpio/gpio305/value",
>and now "why does the level of the GPIO change back after I run the
>command?".
>
>This usability improvement is one more step towards them using and
>being happy with the "new world" of the gpiod API.
>
>Once we settle on a good API here, I plan on submitting a version of
>gpioget/gpioset added to busybox.
>
>> There are also other questions:
>> this uses getopt and only allows to specify a single line name. What
>> if we want to specify more lines like with offsets? Even if you allow
>> multiple names, getopt() doesn't guarantee ordering of arguments.
>
>If you're happy with the concept I'm happy to iterate on the implementatio=
n.
>
>Yes, it only allows a single line name. That tends to be how the tool
>is used, both from the command line and in scripts.
>
>Can you give me an example of your proposed command line API, so I can
>understand what you're suggesting here?
>

My two cents: like Jeremy, I would very much welcome the ability to
specify GPIOs by name instead of number, but the one-line-only
limitation does seem unfortunate.  How about making a command-line flag
that just means "line-specifier arguments should be interpreted as names
instead of numbers"?

So you could do:

  $ gpioget --by-name chassis-intrusion cpu1-prochot
  0 1

  $ gpioset --by-name led-green=3D1 led-red=3D0



Zev
