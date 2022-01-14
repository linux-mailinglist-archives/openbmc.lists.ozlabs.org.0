Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311248F286
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 23:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbGW337xJz30NW
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 09:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Co/qyw2O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=4013b322cd=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=Co/qyw2O; 
 dkim-atps=neutral
X-Greylist: delayed 2289 seconds by postgrey-1.36 at boromir;
 Sat, 15 Jan 2022 09:41:11 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbGVb2Y6Vz2xtF
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 09:41:04 +1100 (AEDT)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20EG5RdP022832;
 Fri, 14 Jan 2022 22:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=nShx1ZEBLL2keLMg7dvtJi4KGthwaFalG1baISgf6Yg=;
 b=Co/qyw2Ozj895Jz64JLlH1HfsRb+D8lbInj6I8dKFZdp8GlgEZLxURB7UG9+LhokvLqH
 5yWxVQhiE2GzqUxqpmJRsW+vUjov/fcvOqSSmBxUZ+PGdmzU7JIUH49D/WaXZLDz161g
 65FKdsVLtrUF+emJVCnGhBZiKxcGDtNLuzWSD8VHpsah1jccGAvRpPF1LpsYomZlQWph
 nwL0drX4O2U/QTKykinRhcXn9CakYzHO3RciKbPeKpyHGJqM7T3KTq8eWjo/OdFFsUAX
 r3Hf9w1xWa/o8aj2KIs0Pm5KTPuaceImHLJUyweeZ2g28htJM8zf5l/7C6J8KmyXpe4t RA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3dkcd0rxw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 22:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFeMN/4TLHwDtQikQ4OeJbcs85Dpx+ECDjuPyCA4USyeua6FjGAyA62mkBGS44N540KIUuW3szlR5uqT7yN3uWWWbR1ZYfpCLfYobq9waIJ4CvCJl+lK3MdiCfSfjBjEXdlti0dHblzB7Z6rI5458c/FKjaM8/fzuIPq20ctNzm8IvUt39lFe6b3RCRMKQYPA9QI8NBZtwK3SilXCFEF40qIR4caACwO1vLM7Cbem7Ud53PFBmZqLmhad6C45WHZ3Qz/0jpKlvhBJJnHCfX6K9uRSDbtXwOf5TQxrGOZRwWMW5Jy39iVXkaLFMK12SoWv7TgKCPLWP1bxzW9tf5V0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nShx1ZEBLL2keLMg7dvtJi4KGthwaFalG1baISgf6Yg=;
 b=Y2w3hB/NaBNKEysDreeqfsDyYvKxRokBgHjzK+3Eht5u1lMmRbXg5lEO8uT/EDETdrDgvScFrTJg7KrJGnXhbzuxUgMfngw3WQgjOjLeb66VBQ9JJCAqCg62QA1XgvMnb1ic79Far7pXFb7DxgdPgACTgRKTJCPIrOjBUXMOB2z0iYrphoOo7piT1WSSPYa2KFLU6zL4fqOVpP0GGHtnBdOhy4Hq/q07KeS0Yi0pOTD72HvCZEQvX1xh192UXIj3aLnYqPJ/HAicHm/DJMpJbgHvKTVf3DmxswgZpM7b+Fm/kKte3sUoxeebwmhwvQyy/T6e0I0DQr3kZQD4JesnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BN3PR04MB2290.namprd04.prod.outlook.com (2a01:111:e400:7bb6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 22:02:40 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::25ac:b63d:b9d3:b699]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::25ac:b63d:b9d3:b699%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 22:02:40 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Procedure for the send review on u-boot patch
Thread-Topic: Procedure for the send review on u-boot patch
Thread-Index: AQHYCZJy0XNg95kMskCXKPRtjxO4GA==
Date: Fri, 14 Jan 2022 22:02:40 +0000
Message-ID: <20220114220239.GH5754@packtop>
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
In-Reply-To: <YeHE3qPWS0LpmLIb@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c846ca0-f796-49a6-1043-08d9d7a99533
x-ms-traffictypediagnostic: BN3PR04MB2290:EE_
x-microsoft-antispam-prvs: <BN3PR04MB2290FBA8DC0F417C9C6B9972C3549@BN3PR04MB2290.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kzKxyEN1KenXYypWEV/eVqI4IU3pmeRBu0cQ8z3UQ1dRebnbbeGoYQGAuNr1H7fYJNhclLjYssMYUCJNyCVwyLyda9Md5EjPbH6RzxDndwBRjDmVUgmAa75Xpb24iyNBlLC9P0LYevsLSoE5aAhNfK3axro4FK8hIVbn4NWM66DjXIpTGVLBD9jvIJ/nsq1hrJYtfdNkRrFansa6XxSB5/PeBa/sO0gM0+FmGTZo6eJqWTMa+/OzCkM7ykKZYNcxSjvZXMjW8kCwR59KK0Sf04PZDwJ7dJIyjqubaJod9kFzlZxZcVEuZllPrgs9JW0Gj7d6RDKs88qG2sUzgyD25TkYq5nAvGOKmqOYPUDB5tjskMU+7gYPpnb99df2dmVLQ/6AQhViKv3IucUrHZd1vu1Aq4xcbAXop1oI9fsHoITmXJRV2BFYJfgSuBt2zjgpq9MygtZw87J49bVVT7smeCGK5frVYuJGSkGqHeMKhy5HbU1/ZVVJ6hrSPmBmhuCvQGEAnGRJPf/Iut91HJH0WDKMwkRzl5NsX2spp3H8IF7xToALKPlAkUC5+++AYB9amIJC0b4TGRc0OtXFrgv1ogwqtz019LW2eSNGg8fLw2TquhP1R21X5LIrWelm+YCBeuCJDJ5mwMrrgaFeb2mQxHP61F2I4b1HmUvjvyyPBQbwkbYcOv2iZFRwh7WlvgjzZwIE0z1qgVpFwtzsWC/t2V7cq4K3CI9VT2yyoNPDpewt2a7KHxB+VOEIAtvvxCL8ukYUMWPtfHslE7b5gz3NuyxwHXU4H75WMq+i63f9rtY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(33656002)(6916009)(5660300002)(26005)(2906002)(76116006)(91956017)(186003)(38100700002)(8936002)(54906003)(38070700005)(122000001)(966005)(8676002)(86362001)(6486002)(9686003)(6512007)(71200400001)(33716001)(66446008)(66476007)(66946007)(64756008)(66556008)(1076003)(6506007)(508600001)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WSduxeEGUb3u/9MtNJIS7E58ls504rVG/xFuflWU25ANIpeBtzLiBT65K9yx?=
 =?us-ascii?Q?/OWvnlb1i/u08AV8RbgTcPwEvk9EHwBsQfDCnTtTp7o+XwOXcElhwmdK+L2x?=
 =?us-ascii?Q?tYQP4tC0f0aJ3zjRKl/ETUxCAjwKoJb+Bl7jTuApWMW3/tzDduMrbA7AqwL0?=
 =?us-ascii?Q?kJof960RxuSsyn3uUjALFNRYaC3Vitov0m5kb+SYggWoTNdwl/NN6YhGJv4c?=
 =?us-ascii?Q?xyZUdAdPcrMWQ6x1DTxJkO+1Pr/UHVunGhjwy5HS4j9K9q/p9pEvDsueWmbZ?=
 =?us-ascii?Q?Ms+LupMTfeNgf552YXNwym1YmJmAB3/wPJxCGIWB9K8/mwvd8JovMoe4lCS1?=
 =?us-ascii?Q?/7HnR86A3vG81t7ILDJAuCqERDx1FhjHBzmE/6LIoJfqsqIGiQ0YZoDO9fIB?=
 =?us-ascii?Q?L4nKCONo2EhvPwMMOHpbfupS/zSGaYSf1Tu8V1UrOAWtH9LIyJ2XjMxGdMMe?=
 =?us-ascii?Q?U+aVBT0CZOnUoE1VR6Pt9m1RvZeUHlkllIJQW2eUuYZSkKgRzdyKuZm9dy1N?=
 =?us-ascii?Q?xSq0q7rM8M4naf8lU1kG6AP49oMUSeqzHfoVa5xp76Cii1LZXdmk4Bo4bjJW?=
 =?us-ascii?Q?v2TZVFMw2gb34Rd5TOgZcrwGhsUIZ5JbgN9Js7Z/deR8lmanSjjKEWZKufy4?=
 =?us-ascii?Q?orseAT0nGnvHCoHd782/oVLjqWDLKlel30yo6e30RNr7eOQ0S+eXQusvVnsh?=
 =?us-ascii?Q?8ZYFezDQe4iTqHKiMY3oE2IFFFd5O7Thco/OVch/yRCzmXPPZYp068l9RiKH?=
 =?us-ascii?Q?ATot8e8yeerB6VdCnwa8+K/G5BE4IRKX5dcaZWWBmGTBgtv/1s23gqCZGglS?=
 =?us-ascii?Q?rm5GjaoNduzJSxekp14hOloFLhwsn79FFcoywTAGdhElWglC+hkOsznNsHrP?=
 =?us-ascii?Q?rioh+2cgn0kFoOXZ0XybpulJA9Q9ITpEYg5N1S+Wi5v4kRmaB4kSrO8aw0ju?=
 =?us-ascii?Q?l+5JCXocBr1a/jIyTblbxarLlndOpbGmgiWcGKnwpe0sAD4kGiR5H8c0SxGO?=
 =?us-ascii?Q?kJBi0yZSY/UEdHVmgz3iKWcSnqwMliKQ/mUWuiTQGOlMXJSV0SzZdKfu4dei?=
 =?us-ascii?Q?Rj54dAbJuvCxFfC65zD5/fJ4fM/pBE5pP/YuMALCgrfUAQDXK/x8UCK0+gOc?=
 =?us-ascii?Q?yYb2WtyfMbzWqUqI4J5q5WBNVnVAQaiwdd0LwDS2MORGMV76O/suZ2tJn4t4?=
 =?us-ascii?Q?POEC8TctnUcaI7+QdNTZK3bQvkGnPQezRrrm/jBJEyx0QK0z63t3+6eTQG4U?=
 =?us-ascii?Q?aDF6/9PqlcQ6rzOBbaHwHJLiRqshmm69kCnHdCo/oWgBEKl/0+4vMnNGCqZx?=
 =?us-ascii?Q?WjK4qoL1S8jh9oeQTU+/Q7VFUc+kEnXA61e1wLsm9vR0fZfm0q3UiNcvn0N5?=
 =?us-ascii?Q?w4HYUig2nARiD+EzgjnRws8tm6w9Z2vgGJI9H4nF2iuepu+8Ht+TCj0Fp4UH?=
 =?us-ascii?Q?t34QfSwCTqfcrp5QtSSeHY+yaCQmUYq4TuqWN5K9eIwjSQgSrGzljQPBX1X+?=
 =?us-ascii?Q?4nYkt1KQVGOuSP0zXYzHQnIOZm/yTU4tox6Y2c5rlBKTyWfb+CCVdgDPjUQ4?=
 =?us-ascii?Q?bddATVAOv3oTcRIOPtaS/I+jov/4rq/Z5A7II39xUy2odk5+XKgYUDZ07/6H?=
 =?us-ascii?Q?egXb8zvfUDIvX3Gv5/WYZ7o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B0876A8597B25B4DADA5336D19953692@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c846ca0-f796-49a6-1043-08d9d7a99533
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 22:02:40.0827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4RAk3rAfLo6iJsp7Y5BuhpYHomhe6hc4uUNqjnjEq2dUTD4nmyydYjYZrvhXYlDknSwC+6ZwB7TPpbbJ/1cAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR04MB2290
X-Proofpoint-GUID: YGJ1ZBs7NCR8H-2M0UVn_YtGRO8Z6o3F
X-Proofpoint-ORIG-GUID: YGJ1ZBs7NCR8H-2M0UVn_YtGRO8Z6o3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140124
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "velumanit@hcl.com" <velumanit@hcl.com>,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 14, 2022 at 10:45:50AM PST, Patrick Williams wrote:
>On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
>> Hello,
>>
>> On Thu, 13 Jan 2022 at 08:52, logananth hcl <logananth13.hcl@gmail.com> =
wrote:
>> >
>> > Hai All,
>> >
>> > In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
>> > https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc
>> >
>> > I want to send a review on this particular branch in u-boot through up=
stream.
>> > Is there any specific procedure to upstream it,
>> > kindly provide your suggestions.
>>
>> I strongly recommend using the newer v2019.04 based branch for any new
>> system you're bringing up.
>
>It doesn't seem like anyone is using this branch for any Aspeed system tho=
ugh.
>
>```
>$ git grep "v2019.04"
>meta-aspeed/recipes-bsp/u-boot/u-boot-common-aspeed-sdk_2019.04.inc:PV =3D=
 "v2019.04+git${SRCPV}"
>```
>
>I think everyone doing AST2400/AST2500 work has been copying from existing
>systems and still pointing to the v2016.07 branch that we have working in =
the
>tree.
>

I think g200a, fp5280g2, and vegman are all using the new branch?  And
if I'm interpreting the below correctly, also any aspeed-g6 systems that
haven't overridden the defaults?

```
$ git grep 'PREFERRED_PROVIDER.*u-boot-aspeed-sdk'
meta-aspeed/conf/machine/include/aspeed.inc:PREFERRED_PROVIDER_virtual/boot=
loader:aspeed-g6 ?=3D "u-boot-aspeed-sdk"
meta-aspeed/conf/machine/include/aspeed.inc:PREFERRED_PROVIDER_u-boot:aspee=
d-g6 ?=3D "u-boot-aspeed-sdk"
meta-bytedance/meta-g220a/conf/machine/g220a.conf:PREFERRED_PROVIDER_virtua=
l/bootloader =3D "u-boot-aspeed-sdk"
meta-bytedance/meta-g220a/conf/machine/g220a.conf:PREFERRED_PROVIDER_u-boot=
 =3D "u-boot-aspeed-sdk"
meta-inspur/meta-fp5280g2/conf/machine/fp5280g2.conf:PREFERRED_PROVIDER_vir=
tual/bootloader =3D "u-boot-aspeed-sdk"
meta-inspur/meta-fp5280g2/conf/machine/fp5280g2.conf:PREFERRED_PROVIDER_u-b=
oot =3D "u-boot-aspeed-sdk"
meta-yadro/meta-vegman/conf/machine/include/vegman.inc:PREFERRED_PROVIDER_v=
irtual/bootloader =3D "u-boot-aspeed-sdk"
meta-yadro/meta-vegman/conf/machine/include/vegman.inc:PREFERRED_PROVIDER_u=
-boot =3D "u-boot-aspeed-sdk"
```

FWIW, I've also got another port in the works (Delta AHE-50DC Open19
powershelf) that I'm hoping to start upstreaming in the next few weeks
that so far seems to be working well on the 2019.04 branch internally.

That said, on some other systems I've experimented with switching to the
newer branch has caused various problems (which I haven't had time to
fully track down & debug).


Zev
