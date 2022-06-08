Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43C5420CE
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 05:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHsYR6qTWz3bkH
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 13:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ukx+6jnz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ukx+6jnz;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHsY13gmWz2yK2
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 13:05:25 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id u3so26495794wrg.3
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JA/2GViIMIAMPVvrNqDZJAQIOwb4dDIYKycMYLy6nwk=;
        b=Ukx+6jnzP8R8ZO9foXPXfHugU/y6snzdO68g8n5qYzt7yy/ovqBxRoe1QQxquRFGxh
         qF8Ih0MH/tV1af6rN4dwgfnYHBSvhZjuvqe4VKkHI9Jvl/lQ4U3iSDsy7Le+eOlxhKwF
         53qwc1dUKTPBz2e6S2gOHZvoEqtMFvb6B6aII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JA/2GViIMIAMPVvrNqDZJAQIOwb4dDIYKycMYLy6nwk=;
        b=BBULnzRuuUO2L71EwuA1SRlomppygT54IroabRvMq8l0wcFg0xOaqVfqegIewHY0JG
         We/IwDjqfRV8GTEsFXtnOMHHTsdZEu9a5JfArpospILfbwtPRErQ3rqgLeYfZVL+XFsV
         qjM/uwfQ7qJcJOEogNy7ycMR0hK8/j9UhiaIaLsYu6O9zEEDU1Ie3wFCO2FfMOH2JqkA
         OX8R/9zJw+gUurgPGcaXiL8T1FJz8oEWCtEHmmpXMLyfxlPWIHrVIgYjx/rE1v1tgBor
         8mtyUu33BIapF885XxTas+Bl8oQW5gjTZEn74kwquhyTJ0/XqVirgfpcmUKJ2aBb36cB
         86gA==
X-Gm-Message-State: AOAM533tAz0bjtKY9CAIifU/IYg+IhYgKnZ+EtzEleimUbLuSuIHMwQX
	xibPmJI6+Z1D+oedSPHufVKy2w0R9AcQzsmIZICqC5ZnzMk=
X-Google-Smtp-Source: ABdhPJyhrZwpdgqf740R/nq0ng9HfX+xL5+oz04m0plCgVcuNazh+Xmhv0pFGEdLaWo/5kE93bUTYZHobmi+67C4CR0=
X-Received: by 2002:a5d:5686:0:b0:217:7da8:8c5a with SMTP id
 f6-20020a5d5686000000b002177da88c5amr16384205wrv.3.1654657518624; Tue, 07 Jun
 2022 20:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com>
 <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com> <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
 <dcf3bc8e-eaff-1469-e034-141aa0a4acf1@kaod.org> <09b467bf-2acc-1834-2143-e7e735a74b53@quicinc.com>
In-Reply-To: <09b467bf-2acc-1834-2143-e7e735a74b53@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 03:05:05 +0000
Message-ID: <CACPK8XfP3T1gX_3-BWM3tZHrnwCqjNXz67nE9anxat-EfTmdaQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jun 2022 at 14:03, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> On 6/7/2022 12:43 AM, C=C3=A9dric Le Goater wrote:
> > On 6/7/22 03:05, Joel Stanley wrote:
> >> On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >> wrote:
> >>>
> >>> Ping
> >>>
> >>> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
> >>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
> >>>>
> >>>> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which =
is
> >>>> equipped with Aspeed AST2600 BMC SoC.
> >>>>
> >>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> >>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >>>> ---
> >>>> Changes in v2:
> >>>> * Changed vendor name from Nuvia to Qualcomm.
> >>>>
> >>>>    arch/arm/dts/Makefile                   |   1 +
> >>>>    arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208
> >>>> ++++++++++++++++++++++++
> >>>>    2 files changed, 209 insertions(+)
> >>>>    create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>>
> >>>> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>> b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >>>> new file mode 100644
> >>>> index 000000000000..e966f739b708
> >>>> --- /dev/null
> >>>> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>
> [...]
>
> >>>> +&fmc {
> >>>> +     status =3D "okay";
> >>>> +
> >>>> +     pinctrl-names =3D "default";
> >>>> +     pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> >>>> +
> >>>> +     flash@0 {
> >>>> +             compatible =3D "spi-flash", "sst,w25q256";
> >>
> >> Compatible strings should go from the most general to the most
> >> specific, so these are around the wrong way. I see you've probably
> >> just copied the ast2600-evb which makes the same mistake.
> >>
> >> In the dtsi we have jedec,spi-nor which you overwrite here.
> >>
> >> u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
> >> should update the aspeed driver to use that?
> >>
> >> C=C3=A9dric, do you have thoughts here?
> >
> > Yes. The closer we are to the Linux DT the better.
> >
> > The "spi-flash" and "jedec,spi-nor" compatibles are equivalent for
> > the SF driver in U-Boot. I think we can remove all the :
> >
> >     compatible =3D "spi-flash", "sst,w25q256";
> >
> > from the Aspeed dts files.
> >
> > This fits what the latest U-Boot does.
>
> I checked that it works without the compatible string. I'll drop the
> line in v3.

Can you describe your test setup?

When I tested, using the ast2600-evb.dts, the driver reported:

ast# sf probe
aspeed_spi: flash-controller@1e620000 has no flash devices ?!
Invalid bus 0 (err=3D-19)
Failed to initialize SPI flash at 0:0 (error -19)

This is because the aspeed_spi.c driver counts the number of "spi-flash" no=
des:

static int aspeed_spi_count_flash_devices(struct udevice *bus)
{
        ofnode node;
        int count =3D 0;

        dev_for_each_subnode(node, bus) {
                if (ofnode_is_available(node) &&
                    ofnode_device_is_compatible(node, "spi-flash"))
                        count++;
        }

        return count;
}

We need to fix that if we're going to remove the "spi-flash"
compatibles from the device tree.


>
> Thanks,
> Jae
>
