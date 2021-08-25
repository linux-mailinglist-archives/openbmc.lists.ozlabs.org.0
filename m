Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7F3F74E1
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 14:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvlJX2kYKz2yQB
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 22:14:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mSwUsQBC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mSwUsQBC; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvlJ54PX5z2xTB
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 22:13:40 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id a66so7986497qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8NtVfFIdQrdMFGJpglOeMcPSG6OS6uEwAjno4qe8s5Y=;
 b=mSwUsQBC5BzgFbLpddqhDpoI2dTmw6CPX3OjpJoMKyL3ku+5YCd6FHHlFpg6SV24mt
 2YLwXxmFamqdErnfisLhxUH4+29oiA4j1aj8cLCDGnTNXxh0T31crIApueEk7hoOOdby
 bR33HKwGHRIXQzUKh3WyQ2IlDFdpEgQgMmfZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8NtVfFIdQrdMFGJpglOeMcPSG6OS6uEwAjno4qe8s5Y=;
 b=I6vLu1gjILZvZtaH+y28ytuuDLK7jWdI45bqC1y6KW6nO3CKN8iCQ08G0tBd9xWgtl
 m609Wr+QwU1fnwECHkQbgcu/CdmzKzURDVWXlrBmnmc8+b+1to/8B0fP3kz/LH6palnp
 6cF1+j+sj+wZDAITfygYsJwX3cTaTF7zGUl84CV+cSy1xEbrMbYK5RIv2tuYYK0OX/ai
 L/xFtOrgoh/zL3jQP7JceFRYzi49ITPo+bfAET5bILlkVnWZIcrThEZDASdaFwr257gU
 RdxSLITDszwo605FH6iU2OAlW/mwzbymhq3LRMIwGItlivAw6gXI3KeH7t7ulm/LM1Vd
 Puhw==
X-Gm-Message-State: AOAM5310aerqphrULAqChcAcmVqPOOta9xrn+bUrwF2/NptkVeUCrD6h
 Y2X5PD2z++75LMFkt9yCQ9VyDrLq9v9UGx8PsAM=
X-Google-Smtp-Source: ABdhPJzY8ZOK1zPH00T8IcUU8W79bwgp4Qy9TB+Kv8d6ptnDOFIgPuDfb262kwK8MIzEasac4voYNDEnkEbJX8QF3wk=
X-Received: by 2002:ae9:e407:: with SMTP id q7mr31599527qkc.55.1629893615836; 
 Wed, 25 Aug 2021 05:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
In-Reply-To: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Aug 2021 12:13:23 +0000
Message-ID: <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 =?UTF-8?B?S3VvLk1hcmNlbCDpg63lo6vlvrcgSVNW?= <kuo.marcel@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Wed, 25 Aug 2021 at 12:11, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> As titled.

Thanks for the patch.

When submitting patches for open source projects like the kernel, we
usually use git-send-email. This will send your code as an inline
diff, allowing us to review and apply it.

If you could resend that would be appreciated.

Cheers,

Joel
