Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5C41BEC2
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 07:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK4qp6FVDz2ybM
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 15:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=CEfHdYjB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=1906b631cd=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=CEfHdYjB; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK4qH75lSz2yPB
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 15:36:10 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T0Xduu015815; 
 Wed, 29 Sep 2021 05:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=Ddo3G/XRJMgp3r3lRLC4zzg/lRnMPVq1zMKP8EQrY6g=;
 b=CEfHdYjBOYIJKurrGw4SuCSiCfiSRBfUc/nI4ZP62pGYOrWtIu1in25CKz17LMUHAcEd
 /CrVhVJfzqCvU7aZ12ozjg5rns+jLybt7rWnp4J7+zcuUTKfDB2ZIcw/DIOsSxAsyrne
 MUlZbVsdZZRa3nJ+z8WcVcFcTzAklWWsYvuujIDMMY4UcIThqjHKkRRb7hHvFRj21IOq
 HTheONBoACwVCRHZ6kLBuUjRFB3xfxv3f3j5AJo0ETQ82AY5P3ZLIcIZ0nbCXW+uuhs9
 7zXDTGJitSzDA49peGmudqJl4po6rx3iXFj5dPK8IaITGpBgJgD4QnjCaYgkQWIt6FUQ VA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-00268f01.pphosted.com with ESMTP id 3bc79ta2j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 05:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUd86+JVDvhX8gGN7eWS+UohW15IYlNzFJu+j04asoR0A1iV46E+T5t1/A5j2YxK9Jz1f/esUeJS6Vrb/6reDgivKjMrHxm/5HEsipqmm/KeaE3/q8/CHZBohGB0TVXI5GUPGMSAc1/Wg+iF0NnnFH1ouptCnSzYS9RGrWyw1qiVFHeByIkar1axmjvgUjZ53ZcAUEqwflWnD45c4dzYeNecfwmvmjpoY2Wl29x0X3i44B3iBxwujUs4hI8E0wFRdse+T1ALbSqYwkwUZzIVBrJk0xutgP233l54wnsFI5q5p50rbR9FwkyNGIck+6aSIauDXr08QabHkkyPDuotNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ddo3G/XRJMgp3r3lRLC4zzg/lRnMPVq1zMKP8EQrY6g=;
 b=NCJICis6EL8Lj2TUemBld5zgHq8MjAybcSsSPquoodt0+S4XAOVj4JUBS67xvog2e9DBJHnQM0MSxuTLNvrfRnpvcT3ZE5UE2S9GYCwPGeTISJoB0zqz7GsnfEtJvL4mHpU5K24mPPwFY1DRrR6IsLwHhoVqgUKLr0EuTQoLiSXmvJ1VWT2It8bCw3iaWN8Wy5dA6csSQLupqgi9HPdbbWKSIusdTrlv0WHStVV/VNRvbTQh4UxgMgevXMHl+vO9usiXIzox/JcHSSg3WHPFtunS561Uq+g/S0vzHGrogi7XvWI4xvQPUw0Znze9RhSFuPlsx9SRMcD14g3X+pCfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7797.namprd04.prod.outlook.com (2603:10b6:8:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 05:30:50 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4544.021; Wed, 29 Sep 2021
 05:30:50 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [RESEND PATCH] media: aspeed: add debugfs
Thread-Topic: [RESEND PATCH] media: aspeed: add debugfs
Thread-Index: AQHXtPMpTKZrYpkgLEiZlACAPtW+vA==
Date: Wed, 29 Sep 2021 05:30:49 +0000
Message-ID: <20210929053049.GQ17315@packtop>
References: <20210929011652.1709-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20210929011652.1709-1-jammy_huang@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none; aspeedtech.com; dmarc=none action=none header.from=equinix.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4634412-d407-4c17-893c-08d9830a4c25
x-ms-traffictypediagnostic: DM8PR04MB7797:
x-microsoft-antispam-prvs: <DM8PR04MB7797870AC805C1E7CEACB6B0C3A99@DM8PR04MB7797.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ij3gSxPqgoiLOjFgUC3C3ZKccS3nBqvpTmr9UKshz0VkjmdN4G+n05FlNQVtZ0w7K4sPhHIw0Jb4qJBvxCEOE0GFt4SMMqcsqwpRzyMTdkNwQMnz5iriZ4wGp8fgfmncF6Wcx4NzCO6N2L5fb2k5pLKUKrEWAMIVg8fYN+q3NFnTk6rOM1GGSYjEvLVZ0+SnzhOK+DjOnMTD0RtJXPsPK5y9IDNgh+3gieHTrZD4CtKZG2eLk2T4v8wrhbHARgB/bDwbB209HAgCLlQuI2a1S6290L0pD4mmpKaX4qg9KtkwDhIyYARolS+ylKn2WoGIKKobSmve2/71LMYzwEGDqArtQI50o+JCz8zgvbvREhcAUyAt/bR26xaLFBQL0WyL+2WW3VNHn8mso3aZ06nid85hk5KXB3lpNrCs83HU/R22hXagOnj0VD2U+YvysK51aUclUCUcnATfPjYajo/CpmpWCioUTCw1sv9OLMHMM5Ms45Pao6Tfg0HE1kBhBfTSwxiOHJp286yxRv8evyqHFoxblmzDKUak3+1MhOEGEfWkJZUDj9dldtl3Y+1PxzMWep+ms3H7UFPVLM8dxoTCjnVlJy/OT28IdPNzoOGiBNH4A0hWui7ng9umoN54s3yV5X2JPbfeIH+WmA/oYlfgqWWxfB7bp5r9WrwLk18I9PPOHcvU0J4uO/pU0z2EAeJo5C1ammoVbrSzXvDnk3JXNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(66446008)(26005)(122000001)(6486002)(4326008)(66946007)(8936002)(71200400001)(9686003)(6512007)(33716001)(38100700002)(7416002)(508600001)(186003)(91956017)(76116006)(33656002)(5660300002)(66556008)(54906003)(66476007)(64756008)(316002)(38070700005)(83380400001)(8676002)(86362001)(1076003)(6916009)(2906002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MPVWI80C3j46EXYFfOCI6M6FA31hwI0jSbe094Vz8q0mxisbSTbP+ktJeTY4?=
 =?us-ascii?Q?fIuoIIxGh8Q8I8qqo8Luo4zv+eilj+9oxweGp1c0OQKOybfknS16SZIAswbL?=
 =?us-ascii?Q?LpjQHMYi1TXUvVKjZDVJ0n+Z2VsvDn+yKsr7PhlA5jIxzQRMo5NRGTkwypAj?=
 =?us-ascii?Q?TrdPX4EAhT+JckJoG/a5TkjhQAyovJ3zcYoNBiPIQHq6aPru7pzvA0B7lr9I?=
 =?us-ascii?Q?hGoZFIR6CUvoyIKFU66cXLuTzn9ZV96IxsEUn4p54rN50KL4tHLEU5B1//2M?=
 =?us-ascii?Q?QkeccVleG6zqntGfuAn3RK1BQk9KJWcjlw4RhRGx9YSK1po7yVkqEa3kZRlA?=
 =?us-ascii?Q?LOwfXcyaFHMHSuPXdEBnj2XPN7ZZPNczxdD2oCEVJfNOeM97bzNLzo3Yvgtu?=
 =?us-ascii?Q?Zo1xxIGVFR9eCgSqixcsfbx6eLnW7gX3Amh8yRsc5culCSS+belq0geNz+0Y?=
 =?us-ascii?Q?AzrPfXqbpwUSCVt0ljFQwcHqxcprz7OabfABLJSffrqSIsQAJOXyLcgeEvgN?=
 =?us-ascii?Q?UCQDUtYJgYTEENJIIPtcgw1FhGYRgA87MJIHllNhmLdlxryvo9gDAFWUWf3u?=
 =?us-ascii?Q?Y5HgsQeI8MN2VY1/68VhOgphUCjVQBuRQO8jRHVNX2dQmlSWlNMY5KdCxwxy?=
 =?us-ascii?Q?Su5S7/ulehfUUyGT17jwnAMgUCTH9xUDiI65WzXm9IpWiv4+zQ6eL74r2c6b?=
 =?us-ascii?Q?9B0BNPJKvYHprX7H0AknwfqLBH/+Dt7UwrtlQAT27aqga75ubUOwrXWfnLQX?=
 =?us-ascii?Q?esmlkv2FBW5CMW1IbLPU7Cycvhnw1Y0/KDW1ysxvzoLmBhFhmoPugHmbK1jX?=
 =?us-ascii?Q?ewOO12LIZrYwRWOIYPmpdICdNngDkE9MsN5mpWBvVopeLRLw623z6z/GySyk?=
 =?us-ascii?Q?xnq4Er28Gxv/+JZjKHP38Yj6boJffKgtKZO+1xMLCcnyn1mLEKQcQEPAlexO?=
 =?us-ascii?Q?mas21HoEZRMPdBunYwcEb2TRnZsqvZupRWxFGo8mzEHwlB6MhW+Ie3mu3jy/?=
 =?us-ascii?Q?b6UBkOHeEQDziXGvi/K+0puCemVFTSQ4RVWjJ+H2YFSUsP0Y6+EzbRevTRFz?=
 =?us-ascii?Q?UDr+N5mAhrBHCngQap8FJpGAYVfvIYBZmxKmouYEIWzeh0WrgUugyzZQdIZD?=
 =?us-ascii?Q?ZJJwtlOU1cA4vfMkOLz4UidD1sJbhV/EGXmljIMkkAuKRr5R1nFn9nVssbMx?=
 =?us-ascii?Q?auzi/qIE0jB4jhgoR5UU5bag/nYQEHvDYuwXYD+jFl6IMcV99NsstwBPmibA?=
 =?us-ascii?Q?TKL2UhRWBzrAB08Xc9b8yq9YbuRLvZpH5HXf6BEguJxQm935jVlqQBA7DL6I?=
 =?us-ascii?Q?zEm8lxZ1zfGx18IsIYyPDaRr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4599C88904522645A13BDDBA41879C2A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4634412-d407-4c17-893c-08d9830a4c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 05:30:49.9737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCvuguvh8RK4XFSMGTrvAORxoLCmiVTgH01dmcoKZgbn8NSPY6Rp0qxHBUoFDrxCBrMwagPBQoUl15AZrL58EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7797
X-Proofpoint-GUID: IU5X1DuFlTRdfhB65_q8FBmG2dWbOBXW
X-Proofpoint-ORIG-GUID: IU5X1DuFlTRdfhB65_q8FBmG2dWbOBXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_01,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290033
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
Cc: "BMC-SW@aspeedtech.com" <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 06:16:53PM PDT, Jammy Huang wrote:
>To show video real-time information as below:
>
>    Signal|           Resolution|       FRC
>          |     Width     Height|
>      Lock|      1920       1080|         0
>
>    Frame#|       Frame Duration|       FPS
>          |    Now    Min    Max|
>       496|     26     25     30|        40
>
>Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>---
> drivers/media/platform/aspeed-video.c | 100 ++++++++++++++++++++++++++
> 1 file changed, 100 insertions(+)
>
>diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platfor=
m/aspeed-video.c
>index 8b3939b8052d..5b98dc7b7b15 100644
>--- a/drivers/media/platform/aspeed-video.c
>+++ b/drivers/media/platform/aspeed-video.c
>@@ -21,6 +21,8 @@
> #include <linux/videodev2.h>
> #include <linux/wait.h>
> #include <linux/workqueue.h>
>+#include <linux/debugfs.h>
>+#include <linux/ktime.h>
> #include <media/v4l2-ctrls.h>
> #include <media/v4l2-dev.h>
> #include <media/v4l2-device.h>
>@@ -203,6 +205,14 @@ struct aspeed_video_buffer {
> 	struct list_head link;
> };
>
>+struct aspeed_video_perf {
>+	ktime_t last_sample;
>+	u32 totaltime;
>+	u32 duration;
>+	u32 duration_min;
>+	u32 duration_max;
>+};
>+
> #define to_aspeed_video_buffer(x) \
> 	container_of((x), struct aspeed_video_buffer, vb)
>
>@@ -241,6 +251,8 @@ struct aspeed_video {
> 	unsigned int frame_left;
> 	unsigned int frame_right;
> 	unsigned int frame_top;
>+
>+	struct aspeed_video_perf perf;
> };
>
> #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_de=
v)
>@@ -444,6 +456,18 @@ static void aspeed_video_write(struct aspeed_video *v=
ideo, u32 reg, u32 val)
> 		readl(video->base + reg));
> }
>
>+static void update_perf(struct aspeed_video *v)
>+{
>+	v->perf.duration =3D
>+		ktime_to_ms(ktime_sub(ktime_get(),  v->perf.last_sample));
>+	v->perf.totaltime +=3D v->perf.duration;
>+
>+	if (!v->perf.duration_max || v->perf.duration > v->perf.duration_max)
>+		v->perf.duration_max =3D v->perf.duration;

How about

  v->perf.duration_max =3D max(v->perf.duration, v->perf.duration_max);

instead of manually testing & branching?

>+	if (!v->perf.duration_min || v->perf.duration < v->perf.duration_min)
>+		v->perf.duration_min =3D v->perf.duration;

And likewise with min(...) here.

As a minor style thing, I might suggest adding a variable declaration
like

  struct aspeed_video_perf *p =3D &v->perf;

and using that in the rest of the function to cut down on the
verbosity/repetition a bit.  Or actually, since it looks like there
aren't any other members of struct aspeed_video accessed in this
function, maybe just make struct aspeed_video_perf be the parameter
instead?

>+}
>+
> static int aspeed_video_start_frame(struct aspeed_video *video)
> {
> 	dma_addr_t addr;
>@@ -482,6 +506,8 @@ static int aspeed_video_start_frame(struct aspeed_vide=
o *video)
> 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
> 			    VE_INTERRUPT_COMP_COMPLETE);
>
>+	video->perf.last_sample =3D ktime_get();
>+
> 	aspeed_video_update(video, VE_SEQ_CTRL, 0,
> 			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
>
>@@ -600,6 +626,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg=
)
> 		u32 frame_size =3D aspeed_video_read(video,
> 						   VE_JPEG_COMP_SIZE_READ_BACK);
>
>+		update_perf(video);
>+
> 		spin_lock(&video->lock);
> 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
> 		buf =3D list_first_entry_or_null(&video->buffers,
>@@ -760,6 +788,7 @@ static void aspeed_video_get_resolution(struct aspeed_=
video *video)
> 	det->width =3D MIN_WIDTH;
> 	det->height =3D MIN_HEIGHT;
> 	video->v4l2_input_status =3D V4L2_IN_ST_NO_SIGNAL;
>+	memset(&video->perf, 0, sizeof(video->perf));
>
> 	do {
> 		if (tries) {
>@@ -1517,6 +1546,71 @@ static const struct vb2_ops aspeed_video_vb2_ops =
=3D {
> 	.buf_queue =3D  aspeed_video_buf_queue,
> };
>
>+#ifdef CONFIG_DEBUG_FS
>+static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
>+{
>+	struct aspeed_video *v =3D s->private;
>+
>+	seq_printf(s, "%10s|%21s|%10s\n",
>+		   "Signal", "Resolution", "FRC");
>+	seq_printf(s, "%10s|%10s%11s|%10s\n",
>+		   "", "Width", "Height", "");
>+	seq_printf(s, "%10s|%10d%11d|%10d\n",
>+		   v->v4l2_input_status ? "Unlock" : "Lock",
>+		   v->pix_fmt.width, v->pix_fmt.height, v->frame_rate);
>+
>+	seq_puts(s, "\n");
>+
>+	seq_printf(s, "%10s|%21s|%10s\n",
>+		   "Frame#", "Frame Duration", "FPS");
>+	seq_printf(s, "%10s|%7s%7s%7s|%10s\n",
>+		   "", "Now", "Min", "Max", "");
>+	seq_printf(s, "%10d|%7d%7d%7d|%10d\n",
>+		   v->sequence, v->perf.duration, v->perf.duration_min,
>+		   v->perf.duration_max, 1000/(v->perf.totaltime/v->sequence));
>+

This looks like a convenient format for eyeballing with 'cat', but also
like it would be kind of awkward to parse if you wanted to do any sort
of automated analysis of the performance data it provides.  Would a
key:value type format like

  width: %d
  height: %d
  frame_rate: %d
  frame_number: %d
  # etc.

maybe provide a decent compromise?  (Easily parseable, almost as easily
readable.)

>+	return 0;
>+}
>+
>+int aspeed_video_proc_open(struct inode *inode, struct file *file)
>+{
>+	return single_open(file, aspeed_video_debugfs_show, inode->i_private);
>+}
>+
>+static const struct file_operations aspeed_video_debugfs_ops =3D {
>+	.owner   =3D THIS_MODULE,
>+	.open    =3D aspeed_video_proc_open,
>+	.read    =3D seq_read,
>+	.llseek  =3D seq_lseek,
>+	.release =3D single_release,
>+};
>+
>+static struct dentry *debugfs_entry;

I don't know how realistic the odds are of a system ever having multiple
aspeed-video devices, but structurally would this make more sense as
part of struct aspeed_video instead of being a single global?

>+
>+static void aspeed_video_debugfs_remove(struct aspeed_video *video)
>+{
>+	debugfs_remove_recursive(debugfs_entry);
>+	debugfs_entry =3D NULL;
>+}
>+
>+static int aspeed_video_debugfs_create(struct aspeed_video *video)
>+{
>+	debugfs_entry =3D debugfs_create_file(DEVICE_NAME, 0444, NULL,
>+						   video,
>+						   &aspeed_video_debugfs_ops);
>+	if (!debugfs_entry)
>+		aspeed_video_debugfs_remove(video);
>+
>+	return debugfs_entry =3D=3D NULL ? -EIO : 0;
>+}
>+#else
>+static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
>+static int aspeed_video_debugfs_create(struct aspeed_video *video)
>+{
>+	return 0;
>+}
>+#endif /* CONFIG_DEBUG_FS */
>+
> static int aspeed_video_setup_video(struct aspeed_video *video)
> {
> 	const u64 mask =3D ~(BIT(V4L2_JPEG_CHROMA_SUBSAMPLING_444) |
>@@ -1708,6 +1802,10 @@ static int aspeed_video_probe(struct platform_devic=
e *pdev)
> 		return rc;
> 	}
>
>+	rc =3D aspeed_video_debugfs_create(video);
>+	if (rc)
>+		dev_err(video->dev, "debugfs create failed\n");
>+
> 	return 0;
> }
>
>@@ -1719,6 +1817,8 @@ static int aspeed_video_remove(struct platform_devic=
e *pdev)
>
> 	aspeed_video_off(video);
>
>+	aspeed_video_debugfs_remove(video);
>+
> 	clk_unprepare(video->vclk);
> 	clk_unprepare(video->eclk);
>
>--=20
>2.25.1
>=
