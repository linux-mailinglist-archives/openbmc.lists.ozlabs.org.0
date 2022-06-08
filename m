Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D041954216D
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHxth5znpz3bl3
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:21:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EhctllVo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EhctllVo;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHxtG4d2Dz2xD3
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:20:38 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id p6-20020a05600c1d8600b0039c630b8d96so174124wms.1
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 23:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Nk5mjeGTf2RnEaWJawlbKVxz/cv4napFX784g5aIS0Q=;
        b=EhctllVoyZpRjorjCGjb3P9HwQEwGkvLPMgE0uoatEjpI8/WObKJNnEjLn5JKhaWh/
         fYqOqxiA9VPGoCVDikfxZ5iUD2mbvOIuYbUCJf9DqOus8Kp4b2MWy5+J0zQzxD8RkfQy
         EOP1ozjofRxnxO/zEV/rIsjPWoo0yHiMnHz4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Nk5mjeGTf2RnEaWJawlbKVxz/cv4napFX784g5aIS0Q=;
        b=Bd2ssEhRtlp5PTTA5XxKVLPOQH6PqQ27W1Q6gj1jrdAUSoCCrlyIfFUijG+9gbnBbf
         md3uKQMV4EXaXszsW5Fy45hKBaJgs03svWiFVadciUNxwShV77hUbkjHS+lXoO+GxjAO
         9QCtQKSHrqWlF1sZPd4K25aXb0b/SuhFLGyDSh6up0iohLiteWzkm/XHl23l8cVHtYmQ
         6KMbs7o5FS8IoiPW04tIwQhmi0FL5YnQaxz7XcZVUU9fde1SjkM+UqgP/iPlGsm4seyC
         TIJA+UR3+0MkduyzDIwdQjU7qExwzsoTzWJF4qwsxmfIqkmUABYUCPYAex1BlAwPh0CB
         hZsQ==
X-Gm-Message-State: AOAM531nzhC2GmUu7jjz4kg9oMeA6mEu0ELyQ6KKSobGGZtGs7XuKH7B
	+KqHf/19DAvq4s0K943KlD8pctTiSJh+5XxpObinletuyRY=
X-Google-Smtp-Source: ABdhPJx6wDnZuIAUhYWcgl7eZeve6hIH1AzzIVOQ/kFC8MNPRRV8T8Cyb1smebvRhSQKoPvgI9FzFp7f5jMslKJiuEo=
X-Received: by 2002:a05:600c:198f:b0:394:952d:9a72 with SMTP id
 t15-20020a05600c198f00b00394952d9a72mr60466242wmq.72.1654669234226; Tue, 07
 Jun 2022 23:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com> <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
 <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org> <09b467bf-2acc-1834-2143-e7e735a74b53@quicinc.com>
 <CACPK8XfP3T1gX_3-BWM3tZHrnwCqjNXz67nE9anxat-EfTmdaQ@mail.gmail.com> <f59e9e6b-1267-c667-9ef0-ac6968b0f728@kaod.org>
In-Reply-To: <f59e9e6b-1267-c667-9ef0-ac6968b0f728@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 06:20:22 +0000
Message-ID: <CACPK8Xf7sF+-tXomayNPGE5H37wco9qK9affC505WxqG3mhBtw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Graeme Gregory <quic_ggregory@quicinc.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/8/22 05:05, Joel Stanley wrote:
> > On Tue, 7 Jun 2022 at 14:03, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wr=
ote:
> >>
> >> On 6/7/2022 12:43 AM, C=C3=A9dric Le Goater wrote:
> >>> On 6/7/22 03:05, Joel Stanley wrote:
> >>>> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >>>> wrote:
> >>>>>
> >>>>> Ping
> >>>>>
> >>>>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
> >>>>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
> >>>>>>
> >>>>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC whic=
h is
> >>>>>> equipped with Aspeed AST2600 BMC SoC.
> >>>>>>
> >>>>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> >>>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> * Changed vendor name from Nuvia to Qualcomm.
> >>>>>>
> >>>>>>     arch/arm/dts/Makefile                   |   1 +
> >>>>>>     arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208
> >>>>>> ++++++++++++++++++++++++
> >>>>>>     2 files changed, 209 insertions(+)
> >>>>>>     create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>>>>
> >>>>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>>>> b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..e966f739b708
> >>>>>> --- /dev/null
> >>>>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>
> >> [...]
> >>
> >>>>>> +&fmc {
> >>>>>> +     status =3D "okay";
> >>>>>> +
> >>>>>> +     pinctrl-names =3D "default";
> >>>>>> +     pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> >>>>>> +
> >>>>>> +     flash@0 {
> >>>>>> +             compatible =3D "spi-flash", "sst,w25q256";
> >>>>
> >>>> Compatible strings should go from the most general to the most
> >>>> specific, so these are around the wrong way. I see you've probably
> >>>> just copied the ast2600-evb which makes the same mistake.
> >>>>
> >>>> In the dtsi we have jedec,spi-nor which you overwrite here.
> >>>>
> >>>> u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
> >>>> should update the aspeed driver to use that?
> >>>>
> >>>> C=C3=A9dric, do you have thoughts here?
> >>>
> >>> Yes. The closer we are to the Linux DT the better.
> >>>
> >>> The "spi-flash" and "jedec,spi-nor" compatibles are equivalent for
> >>> the SF driver in U-Boot. I think we can remove all the :
> >>>
> >>>      compatible =3D "spi-flash", "sst,w25q256";
> >>>
> >>> from the Aspeed dts files.
> >>>
> >>> This fits what the latest U-Boot does.
> >>
> >> I checked that it works without the compatible string. I'll drop the
> >> line in v3.
> >
> > Can you describe your test setup?
> >
> > When I tested, using the ast2600-evb.dts, the driver reported:
> >
> > ast# sf probe
> > aspeed_spi: flash-controller@1e620000 has no flash devices ?!
> > Invalid bus 0 (err=3D-19)
> > Failed to initialize SPI flash at 0:0 (error -19)
> >
> > This is because the aspeed_spi.c driver counts the number of "spi-flash=
" nodes:
> >
> > static int aspeed_spi_count_flash_devices(struct udevice *bus)
> > {
> >          ofnode node;
> >          int count =3D 0;
> >
> >          dev_for_each_subnode(node, bus) {
> >                  if (ofnode_is_available(node) &&
> >                      ofnode_device_is_compatible(node, "spi-flash"))
> >                          count++;
> >          }
> >
> >          return count;
> > }
>
> This is only needed for the "sf" command. boot simply uses the mapping on
> 0x20000000.

The environment reading code appears to use it too:

U-Boot 2019.04-astsdk-00073-gccf81eee1b3c-dirty (Jun 08 2022 - 12:32:42 +09=
30)

SOC: AST2600-A3
Secure Boot: Mode_GCM
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
Model: AST2600 EVB
DRAM:  1008 MiB (capacity:1024 MiB, VGA:64 MiB, ECC:off)
RC Bridge phy@1e6ed200 : Link down
MMC:

sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0
Loading Environment from SPI Flash... aspeed_spi:
flash-controller@1e620000 has no flash devices ?!
Invalid bus 0 (err=3D-19)
*** Warning - spi_flash_probe_bus_cs() failed, using default environment

>
>
> > We need to fix that if we're going to remove the "spi-flash"
> > compatibles from the device tree.
>
> Just sent patches for it.

Thanks
