Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82F6289C6
	for <lists+openbmc@lfdr.de>; Mon, 14 Nov 2022 20:49:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB0JN5DKRz3cLc
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 06:49:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LH4nCfPo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LH4nCfPo;
	dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB0Hn3RDkz3cGV
	for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 06:49:08 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id r76so12502259oie.13
        for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 11:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2qnvu3bQP8BKAp0MknCpetobwNDXzmlzvi9jk2CUdA=;
        b=LH4nCfPoj5WZPH7FRgdUSCFMOnhf3cQn8LYGDPfilcTds2afc5NQb/7Kkzqrq9Chka
         jKdRpshsb7FmYLoQWtJojd3Gjpk8pjINRcsXMrxQt41xJM2rXLiw8Ee69tP7eciUff02
         1nqTOifqF4SesekSkBJyDriSY7IRVxbhvm7XqoJ/fv8BKy3wO/cIu7qBHhlYLIf/849C
         OFq9U+tesvCtHD8JLF0v2T9ygpQIDJiGMWwOBJ76nHiLh2SWyItr6xgrHHudcIcMKhvT
         58MtIk/ZN7qqBwMcmsoGnR6+GT9AoyPsmRd+R58+FwLapFHc0NQXucIegbTjM60hSK6E
         +JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2qnvu3bQP8BKAp0MknCpetobwNDXzmlzvi9jk2CUdA=;
        b=J1im9hT8ZS2pcy61xzdR13khzmW1ME21C/5S3c6lIDzJKHAna3ILlmbZGOdzb5xbeq
         WOYRYNp6ZKX4fL94e97eBCLIZHcYnGHwpzgD5gFh60FwM9zqPzJ39QwpsnCdcEgBO/vz
         /JR71+BfIbRf3T+6rlYa34htMvuXR66r5UlvB/5x97BaFLoTpKnLQnIzqILjGSphYL71
         ES+Ww1TaZDg88zB/7b/kr5QWHtvMzdOesvqvHObE99arpCvraB6seNwmPOKTVeRBtEGl
         DO8nf/MFFlPg7osOfBFz3+ll/JkIDcbf+Q4NvuMG95Gswv947P4frtAGhQ7zzEpLpK2X
         OUCg==
X-Gm-Message-State: ANoB5pleH9z3DIJKwFFm4X4vYpcFQ+fuuK3kaST7xdimdbAaz1e0Vept
	YueAWN0KL5mYw7iH7K7oLLeH696Goio=
X-Google-Smtp-Source: AA0mqf6nZKl6uKinsUYcVHlfV5KjnE4wurHjSUMUviuJGppnIehYTXEmrrTIUz1evU9XcXWA0rOgDQ==
X-Received: by 2002:a05:6808:13ca:b0:35a:1a42:35f1 with SMTP id d10-20020a05680813ca00b0035a1a4235f1mr6411282oiw.227.1668455344076;
        Mon, 14 Nov 2022 11:49:04 -0800 (PST)
Received: from smtpclient.apple ([136.49.194.28])
        by smtp.gmail.com with ESMTPSA id f75-20020a9d03d1000000b0066c55e23a16sm4443982otf.2.2022.11.14.11.49.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2022 11:49:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: obmc-op-control-power_git.bb refactoring
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <3d8ca8ab-56a3-4ad7-8b34-d97f50ae0d81@app.fastmail.com>
Date: Mon, 14 Nov 2022 13:49:03 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <29D5789F-0412-4B5F-AA56-356B6D458E23@gmail.com>
References: <73130EC5-5B2A-4E79-9AAD-88D26C61D71F@gmail.com>
 <3d8ca8ab-56a3-4ad7-8b34-d97f50ae0d81@app.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 10, 2022, at 5:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Fri, 11 Nov 2022, at 07:29, Andrew Geissler wrote:
>>=20
>> Here's what I'm thinking:
>>=20
>> Move these services to PSM and rename them as follows:
>> - op-power-start@.service -> phosphor-power-start@.service
>> - op-power-stop@.service -> phosphor-power-stop@.service
>=20
> This isn't terribly constructive but I feel like given =
s/op-/phosphor-/=20
> results in names like 'phosphor-power*' it's going to be confusing =
with=20
> respect to the existing phosphor-power subproject.

Yeah, good point. We have another naming convention on some service
files, =E2=80=9Cobmc=E2=80=9D, so I=E2=80=99ve put that up instead of =
=E2=80=9Cphosphor=E2=80=9D for the service
files in question.

Here=E2=80=99s all the reviews for anyone interested:
  https://gerrit.openbmc.org/q/topic:op-power-control-ref

Need to merge the phosphor-state-manager changes first and then
I can officially put the openbmc/openbmc changes up for review.

>=20
> Not sure how to fix it though.
>=20
> Andrew

