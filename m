Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1796B8A6F
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 06:35:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbMgn66Bdz3cKm
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 16:35:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B+tUA3Jk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B+tUA3Jk;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbMgC1JLrz3c7d
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 16:35:17 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id i9so4193940wrp.3
        for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2023 22:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1678772113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFapW2xcctamTxNoFIA1cDH06zuFXgzdhE65yzrJ4kQ=;
        b=B+tUA3Jkjw3ZAG467peo/9xw38TeuMmZIiAZbTwwp9SdgLjvqkNQY4z3NUvqP53tGU
         ApTbjbuRiHud3Xyzx8a/2R99HZRpp6QWRpKWXmZmEFTaBv3so3+a8kR33Q70oAOHrA29
         LkKrv3FnzdXgTQLymXNtTjN6m8JJToTDoWn+d6M0qx7abrfUV+GhlBi12FyasamKv36x
         F0gPiW5jZ+O06yjJKR1zwhRjZxkSmDdYpTO8oNHH0o3FPjQglqKUykzjV7jFIfaywK3+
         lxMlJS53eh7uLRrUE2a/KEINz07yoc+vZbsgT6MyV9iWJ9RN+9tjnIDKpoaEI0MoAjlE
         pJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678772113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFapW2xcctamTxNoFIA1cDH06zuFXgzdhE65yzrJ4kQ=;
        b=2TaqQIqVKJ7r5dPWZI/z/a7v17CMpPl96ziCeu/+UeY7sUlzSymuhDhcC8V5b/5Nbr
         qXOne/SGcd9A0HGrnSerCHL4aRlrmeDefHo1e7TqTJneQNxSMQGzg575YBX7Yrv1+KoS
         4neWlFOP5K8yOpzyS6n3gzUpRv9OaF+vUNmrCUxpN1O4OXyp64pbm3cRPT5LLABybmhL
         TtvEw1m51Xq/N9hGvOmKymk+aeomsyo/wty6y0rCihA3B3aPEEbUzx42IkKaOEVtxv/L
         goee6uqRlCV+nuOtJzv5knnigha7laNjUVqc46MdOSrvdYnbdThaAl3dGvREMrBHimO7
         uRxg==
X-Gm-Message-State: AO0yUKXU8QRsElotxwCcYzlwM0mSby+YVqSaWQ+5SWPFI1Dve4TQb1Yx
	yOOxB0eSSgToD2dg+n4pYSGB3H02LtYpHnhAEAApWg==
X-Google-Smtp-Source: AK7set+t4qD64zUc7Llvg3+laCvMx/f7IXF7HHxXD5l2IroaLhAn4R7A8X/GjUcgZz1+0WnqHNwEpDfT0frhQRFO3D8=
X-Received: by 2002:a5d:5545:0:b0:2ce:ad09:4d47 with SMTP id
 g5-20020a5d5545000000b002cead094d47mr1068019wrw.4.1678772113128; Mon, 13 Mar
 2023 22:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
 <CA+J-oUsaF8rNYYff9QZj8C0iZgHf8+YE=LfPuQ74ndx+XrwAnA@mail.gmail.com> <MA0PR01MB6812D93048C946BE907B7DA4F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB6812D93048C946BE907B7DA4F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 14 Mar 2023 13:35:01 +0800
Message-ID: <CA+J-oUvicuX0sqo0xGkMft3m+KsMbdVivK88r2DeQQunWMK6-Q@mail.gmail.com>
Subject: Re: [External] Running evb-ast2600 image using qemu
To: Ranbir Singh <saini.ranbirs@outlook.com>
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
Cc: David Bashaw <theactualdbashaw@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 1:28=E2=80=AFPM Ranbir Singh <saini.ranbirs@outlook=
.com> wrote:
>
> Is there anyway to login using the Web UI also when running image on qemu=
 ?
of cause, the command line forwarded the port localhost 1443 to bmc
443, you just need access https://127.0.0.1:1443 in your browser
> ________________________________
> From: openbmc <openbmc-bounces+saini.ranbirs=3Doutlook.com@lists.ozlabs.o=
rg> on behalf of Jian Zhang <zhangjian.3032@bytedance.com>
> Sent: 14 March 2023 09:02
> To: David Bashaw <theactualdbashaw@gmail.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> Subject: Re: [External] Running evb-ast2600 image using qemu
>
> The command that I used.
> ```
> qemu-system-arm -M ast2600-evb  -nographic -drive file=3Dimage-bmc,format=
=3Draw,if=3Dmtd -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev user,id=
=3Dnetdev1,hostfwd=3D:127.0.0.1:3222-:22,hostfwd=3D:127.0.0.1:1443-:443,hos=
tfwd=3Dudp::1623-:623
> ```
> For your reference.
>
> Jian
> From: "David Bashaw"<theactualdbashaw@gmail.com>
> Date: Tue, Mar 14, 2023, 07:52
> Subject: [External] Running evb-ast2600 image using qemu
> To: <openbmc@lists.ozlabs.org>
> I'm new to openbmc but have read lots fo docs.
> I want to try running an evb-ast2600 image using qemu.
> I ran the following steps:
> .setup evb-ast2600
> bitbake obmc-phosphor-image
>
> The build completes fine.
> I installed qemu-system-arm also.
>
> What command line should I use to invoke qemu?
>
