Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44B69954D
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 14:13:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHb3l652fz3cfX
	for <lists+openbmc@lfdr.de>; Fri, 17 Feb 2023 00:13:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N5Nm+7Xi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N5Nm+7Xi;
	dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHb391z2Vz3bgx
	for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2023 00:12:51 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id bp15so2654100lfb.13
        for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2023 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQqxDtlbj8ZsQltKE34W/iy942f9WvS2sQHB5LE3m6U=;
        b=N5Nm+7XiHUof6fqoF9R+cvRP0tmGFlF0/D7AQ/w1GFXzAJYbS9R5+iVoBt99Lz/1Dx
         Cwp6OfCErz324uaHqLZbPxEfRGVB+oE4YJ7rb//TAbyx44BEaOEUjCH7XoToC/kWurn7
         QXEbYYbpe48HPLLj8z6h0q5WS4HYhZLkB+CbRsZ7TixYUrbYZcLy5Q6VwFCGlg00fsIn
         Xh8DpsLrR1YGzpYlCmKT5wKV1yuWuza6Q0Qx5tm9vz7JDVe43FaJGFfEoqgURb7umi/7
         ARoZ7UBSZPVZ2NQrccXA0P6c5swLjuwpv3C2zX+Fd1V9auRzVd3fFGLFekqc3qhThzk2
         tB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQqxDtlbj8ZsQltKE34W/iy942f9WvS2sQHB5LE3m6U=;
        b=PgI6aBx0mVVGmFK7HqY/KYNQpCDRis4KLAgBlGTjycvOMUQXICSQ8VrEi3S4inlCVY
         01D2DZDOQvwwSlC6xwtS+KIUQdsnYr73ChFwwmtARO5m4ko8mAvx8J1xBFnyTBbmcIcg
         Nyi1N8G1TbU9FoFqmJIHBdt2dgT7ZNN2o2PIk4j153XfT8AnTlnxe1qgFkwPD/rIEpWd
         mNSQsZi07O7fOldCk2/OcHBA5oUa5kwFJH9djHMOK2jxp2OYxQHRxsBKca43zGUt0jlv
         6uU4GIBPudxaULME4qOmjoPtkb03hQcCg+KkqKYG71FfbDZuAgY3MXQj0+bd+/illZ9o
         O/Cw==
X-Gm-Message-State: AO0yUKVEInQD/DCnADk0Q6EOvrvPOVD1PN6v+ztDo1cxQ2LOM+LI8Cxm
	qYLTXCRr/JR/y3d9Od2L/bH65sDf69ov4PmTdkc=
X-Google-Smtp-Source: AK7set8Kc6Q2ElSc9f3umOy7zkwAtyYAnojRetyQ1+i483nYUUcDwL665+iCMFKaT4fsfsGAcB6y3VIxbrj52PbizZk=
X-Received: by 2002:ac2:4949:0:b0:4d5:ca32:6ae5 with SMTP id
 o9-20020ac24949000000b004d5ca326ae5mr1634935lfi.5.1676553166702; Thu, 16 Feb
 2023 05:12:46 -0800 (PST)
MIME-Version: 1.0
References: <000001d93d6d$7618b2c0$624a1840$@inventron.com.tr> <0ef2b569-caae-a5bb-853a-d5135fd00ceb@intel.com>
In-Reply-To: <0ef2b569-caae-a5bb-853a-d5135fd00ceb@intel.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 16 Feb 2023 21:12:35 +0800
Message-ID: <CANFuQ7B92O8gf+iCfuPGw66PAnhC_r2UX_a+pWbnYwiCgsH2vg@mail.gmail.com>
Subject: Re: PSU Sensors Association with Entity Manager
To: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Cc: zehra.ozdemir@inventron.com.tr, openbmc@lists.ozlabs.org, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 11, 2023 at 12:55 AM Johnathan Mantey
<johnathanx.mantey@intel.com> wrote:
>
>
> On 2/10/23 08:33, zehra.ozdemir@inventron.com.tr wrote:
>
> Hello,
>
> We are trying to implement psu sensors with entity-manager by defining ch=
assis and power supply in separate json configuration file according to ent=
ity-manager=E2=80=99s sample configurations.  PSU sensors are not displayed=
 under /xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors =
but under /xyz/openbmc_project/inventory/system/powersupply/{powersupplyID}=
/all_sensors. And they are not shown in the Web UI. Here is the powersupply=
.json configuration we used:
>
> <snip>
>
> There have been changes in the Redfish schema, which is still in transiti=
on in bmcweb.
>
> There are meson flags that allow you to choose between the two:
> EXTRA_OEMESON +=3D " -Dredfish-new-powersubsystem-thermalsubsystem=3Denab=
led"
> EXTRA_OEMESON +=3D " -Dredfish-allow-deprecated-power-thermal=3Ddisabled"
>
> The "new" model, implementing the PowerSubsystem schema, is incomplete. T=
here is a group of commits as part of the 'redfish-power-supply' topic:
> https://gerrit.openbmc.org/q/topic:redfish-power-supply
> The commits are not merged, excepting one.

I will resolve these conflicts soon and re-push again.

>
> I'm sure other openbmc members may also have additional input.
>
> --
> Johnathan Mantey
> Senior Software Engineer
> azad technology partners
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>
