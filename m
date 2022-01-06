Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F724860AC
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 07:42:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTxbk58B5z30Ds
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 17:42:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RDHJ1U4M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RDHJ1U4M; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTxbG6bMHz2yMk
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 17:41:44 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id x7so2983712lfu.8
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 22:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YqHCtCeijWJmxU9AXfm7mGnGRp0VssEQhOwgfk8IoDU=;
 b=RDHJ1U4MLMPODbSr0O8EjWn0+yg39Pi1Bp9BMOF2GmdlAMsRaRHHn+9CU7atErk7mB
 2MR71HWIJJJZCua8QmBfZjKV1iRtscDyIyCIzA9o7ym1KzQ2SwVhpyMb9LDws8bxFX6j
 Mgp+BcT1u76SlM4fFUZa9nvbBirMLEkjWC3Xg2/YBcqSWQF1lhOniSTlQNDE3C/2b4Nf
 oG8TKcYXm2ZEf0s8SmxT+6azJsIO5kM66Ltw5HIVNsNTAVz/BrC3oeYF15X1+hMLPw+G
 MO0Pk+RIGkxcCJOaiv9G0KpeIm+O+Pp92r9QImR0VGfqb1qErjDNxx29lUZfdKnLwFGk
 xEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YqHCtCeijWJmxU9AXfm7mGnGRp0VssEQhOwgfk8IoDU=;
 b=311YSM73dpKCtlvbmrJ46YgXdl2TM237FOekBA2MkCpdvPKmdCC9GiZS4c6/qSOtUK
 /IenumO6Vir8shnKHt52KNRjjh/jt18NXZnT0INQI3fxZysYtZkCCkcfU2cuOB2aSaIT
 JiqgJ+xOkr6cUlv+78uJc6x4HcLLBqrb78aoLSEIW5Z74Y5IWOZ/cJWkD6qoPTHVuceF
 OPuk9HfTJzHoiFD3CQXyg9N94p+JBNlazl1DmA195D0+Yx+gJtNYeD/URml33bb3xsqd
 ImLWX4PLkEmiq1Wqv6tFAmL/ufiOv1ssq5orJ9IiHFQw5f82U8xVN9Cz1kQpAPs/F22I
 hpKw==
X-Gm-Message-State: AOAM531s3YqDHHqyFQ8eiJr9SrAfX2RHq4TV8mC/J6CVeMZ9FKKePo2F
 EFYi01GwVFp9gQOygjYANPdBLlFduhVsMpelcdY=
X-Google-Smtp-Source: ABdhPJyxc0pqHvEGGojbZZMs2HzdqXadWWhwKFfVR99HSzubCzO/ST1cRw1z2kAXTa2cP/M99uAR3fJZwuqgQ8ui9u8=
X-Received: by 2002:a05:6512:230e:: with SMTP id
 o14mr50432898lfu.637.1641451295915; 
 Wed, 05 Jan 2022 22:41:35 -0800 (PST)
MIME-Version: 1.0
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
In-Reply-To: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 6 Jan 2022 14:41:24 +0800
Message-ID: <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
Subject: Re: Update (or generate) /etc/ipmi_pass file
To: =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) <=
maxiaochao@inspur.com> wrote:
>
> Hello everyone
>
>
>
> I now want to add a default user to my own machine (I modified obmc-phosp=
hor-image.bbappend, use the useradd=E2=80=A6 ),
>
> but the new default user cannot use Ipmi. It is because the ipmi_pass fil=
e is not updated.
>
>   I couldn't find a method/tool to generate ipmi_pass file. So how can I =
generate a new ipmi_pass file?
>

What I do is to use qemu or a real BMC, adjust the ipmi
username/passwords, and then copy the ipmi_pass out.
