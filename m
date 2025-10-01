Return-Path: <openbmc+bounces-711-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF072BB1739
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 20:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccNDc1cDNz3cf7;
	Thu,  2 Oct 2025 04:07:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759342032;
	cv=none; b=gg62irpn9DVqk0aVt5kyuRNNpbupvI8lZd2Y7VWzdYox7Cg0e8DD+ReMZwTXTfdl8ODCITg6vNOrMpSxK3ytk1o2v/chkqgOhBcUlwDsjI0klj/PiibgUpEdb2uTenZagikTDXMrD5zEWi18tcTPZO7nqbgWQoA2hiNmpboi8ARNflOmeD8z7eV9trFnBkaoABYdczAqZ0E0RnlVBkDjlIdkpqmlmg/aL+IYosbQjLM6SkGA72kGRBjibTB9dVYhJo3sn6tpuLM93MGIxDsSpzHur8JR8D/zgQlAH0EVy4cCWyj2x02mukOpQBabBMkGdNXVrAiCi/oEdkdbQlhYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759342032; c=relaxed/relaxed;
	bh=RDxMoycS24bvgqsHtFc7ARnA+8jIkJYek+ij4R5LhY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9h6aguwRVjtwBvuTUNfqVneavl7NeCawvRFuxtKTvF+LZ7AfwlgOFCNvZ+RFAhqk4ma4Iga2HUibi0+qQnC9l3RFf480g6PgiPOg7nbvNOvH1ridSHwDuy8NvKjB8ycuRPrGezNmFcz0aP4mn/YwmtM1HTPVM/IoMjpAz5Izxeg/eVh4IVsbtN1tSxsyIRlp7N+cIKoTO66O0ptv43Kcxr4CJrUcuyEyTJi/fSV7g0yJNV0JwCf9/JhHCvlgqCAFBMzAr/Ug+WRIMeNCADyTWHSbn+ru7fwRQTx0S9KdcFbOoNqPkZl0Z8c0mLjfYisb7y3JYY5bHQwNnNep+lheA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JgnFHVDp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JgnFHVDp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccNDZ3wkcz3cYR
	for <openbmc@lists.ozlabs.org>; Thu,  2 Oct 2025 04:07:09 +1000 (AEST)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-580144a31b0so99696137.0
        for <openbmc@lists.ozlabs.org>; Wed, 01 Oct 2025 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759342026; x=1759946826; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDxMoycS24bvgqsHtFc7ARnA+8jIkJYek+ij4R5LhY0=;
        b=JgnFHVDpBJM6HjTHhoW5g63Fg7KUtyRq+Cu1ecRBqjHfQJzFGSBvogqDW99Ra2uJac
         Jl7P7v1IMw7SneB0PFtw4t3V0Ht7+hGR4l8kvmqyus47nfsWbCMmI2bJwqL6Vszu0Sbp
         Cc3GbIgZpTj00mF0rZvhN0OW1V0MGe1GbOzy76XNNjFgbeXQrj0eahEht26jdeLgXPel
         CtnbR0gFaN58KeNoOOzlY3rqag9heHkZfVgK7nFM3hoHol2u0aPp4MKp5TnqhsQGRnUN
         be9DYx8zTYujrHi7PhMey5KedgdjQmEqBp/HUQILEv7fOJkT437GYqoRb6qIxpftH0bJ
         yosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342026; x=1759946826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDxMoycS24bvgqsHtFc7ARnA+8jIkJYek+ij4R5LhY0=;
        b=i/K7LYOuxqBffLzLsyzWXle3xhWdomE5V2tsr12jijMy8rv+e1FfmYfN9mLS9FPh6z
         K2U3oIh/ybH9LJuJVLGX72eyjRBrU7Gce2axJtp49WHvf1aPzxvgvmPe0pJz9UTDa1jJ
         zNNm/mHTXusr5SBHvjgptuR0mj6JdXHoMa4/l0D88NES0Xc0CkXyRCH4mNZhrSydbbkn
         vQTEcmr7K7INRPcMxLItGP+ho4TGaEAPAzmlD5ty9fVMXv2CY8c65tmtSu3JfNQs+cGv
         pwJydfOTDKYVzv3xxHcXBeW7Q11IWoRuSO72qQG9+DIPN8hGSSfP3oM+eMOhEDlt5FSy
         uAUA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7WZ+7Q8W7T9huIvZSIrzhxj2nX5zEMh78Im8/QkLoVpeq7kfiOycs7wm70hrFhujIyvnktqI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxX+UVnuThIPFBR5hC/OYz59/hy+gE35vj23WMjRAMDEUm7sT/3
	3j+iZf6927ct2ToBYPYalm2vLBclgNVVuo/c+jfUeco/qo8jC5Fl0OL+vyAU/pm6ld/FxJUBpXA
	rsIDotqHGzVVSb0A6NsPDP0NvLaUXkAb71g==
X-Gm-Gg: ASbGncu0ROftQDfEe+tuiJMr5WRIx/JRxJfPTdVNNa0bqld5dTWa7YbPmAYNQw0PJA+
	s/k2+5uNWajW2nc8GVR+Atk3erqEpJvkZPZk5Gdo5lilH3+NJLDOKGxuptoTqfcFWJ1SPTvJmep
	YTOxtKLN4ldeWCu8OFpAJ/GW5nJb5rNw3Y1PSnSZ3AuRJs+A8GyN4U8P6ahfjsnQEnXx4ZZAX2k
	w8sWjotMi6wSKN/uucE0AxWh6CC
X-Google-Smtp-Source: AGHT+IEltAjyiUBesQGsruraeF7E8XplpL5TpwMiu+mv7RNEtCnTfEgym/jNP8OXPmmIB5PoyNbjoDnbF74ahVTbVO8=
X-Received: by 2002:a05:6102:442c:b0:59c:e912:96c2 with SMTP id
 ada2fe7eead31-5d3fe739c12mr2365906137.35.1759342025765; Wed, 01 Oct 2025
 11:07:05 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CANbCeAEeNUsV82ae4AexY-LNAh7UHggaNMQ3+gcguxFY1dq0_A@mail.gmail.com>
 <6C7787FD-F4D6-4131-9775-EC743968BF30@stwcx.xyz> <CANbCeAERj=GshjJJKvKySLwNtjJKerN8E+fN-uDzdB6rsr5FKQ@mail.gmail.com>
In-Reply-To: <CANbCeAERj=GshjJJKvKySLwNtjJKerN8E+fN-uDzdB6rsr5FKQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 1 Oct 2025 13:06:48 -0500
X-Gm-Features: AS18NWAPtCAggPl2WuaS5umU8G4QFu_HxBzv1fZRjOzlwzlCuxf4AFXmKqr2njo
Message-ID: <CALLMt=qWbXyKbaP0X=q12G8=rzTODt=Qdgw2uZB+9Z1RRo9hCQ@mail.gmail.com>
Subject: Re: Request for Gerrit account approval
To: =?UTF-8?B?6ICB6JiH57KJ?= <twpeng50606@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org, manager@lfprojects.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 1, 2025 at 5:53=E2=80=AFAM =E8=80=81=E8=98=87=E7=B2=89 <twpeng5=
0606@gmail.com> wrote:
>
> Hello,
>
> I am contributing to OpenBMC in my personal capacity.
> Please find my signed Individual Contributor License Agreement (ICLA) att=
ached.
>
> Name: You Peng, Wu
> Email: twpeng50606@gmail.com
> Gerrit username:  You PengWu
> Change(s) in review: https://gerrit.openbmc.org/c/openbmc/phosphor-pid-co=
ntrol/+/84144

Welcome to OpenBMC. I've uploaded your ICLA and added you to the
appropriate gerrit group

Andrew

