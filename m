Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5923B2C8996
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 17:31:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl9jS2dQnzDqkT
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 03:31:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rq94cuor; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl9hL1QLRzDqVQ
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 03:30:41 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id v202so14744064oia.9
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 08:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C4DEdLR1/hLtWib4sNUvH2fiz6UvoWxSHwU1Wrj0evk=;
 b=Rq94cuorlf7Mm9CtNJPj4mDE7sfoGulJ/msNsFwK3WdJiDvY6l8uk5FHRb/wbSxlt4
 FfYTbYrJQGLjyCAhQOUbxLXgLTbFIF/m0iu4Sxp2iBxM+pq1eQg97/CDaO6Uudgsaoov
 Fu9Hu/HrprhlQ3YskyEqNTWTTO6Y3t03w554GdtMUcUpPB39S5cSf3Cn7KymgOP7SQYy
 3R34l6HB9ZkXII+C0qsD8omdUXPmfWUIttO/4wJDMR1DmDabKNjO+rOgjPjK0unWyMan
 E+Keov8Y1gxAyfTCtAflXJKLX5dtiLCuIPSiIsNKgDd/mnNve73PlDStXpZUwQnJ9mZA
 Fx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4DEdLR1/hLtWib4sNUvH2fiz6UvoWxSHwU1Wrj0evk=;
 b=F4ocLIyBFgosuGcepI70MN5WHa8Odc3T5hPv1zy8BeRQrWogJTDRoe4v/SbgN/vV05
 t+XTBh/B+xnhrMm1qz0U7QyfLH+8AviunrZ2Y93HiJvXkjpy13xLsfFrjiftxBGJaSSf
 RZ4V2gTxIPwHHV1NnQ7BDa/80nWU823c9Xp5VYbjKyKc4LEc7KX+nyae35lhQHRPpFEN
 XveZ2rMcEtkLohn9/eooRO48NwQYEpOBOdhmeaSYr0AoL+SVB+jBl09JFwK3TfyZaTYk
 JKXot6dvqf2qMCcegBQJPFkM8Hiky7vok3Cq32Li/Mc+JVGP2JZGIHjMtCDjvTvoKIYL
 t2yw==
X-Gm-Message-State: AOAM532rwEVWiD1HB2Aydc+cD5S0jqUDIBKzF1Li1qECfBYRs0prrf56
 cnxy+TSLV+u/swCygAwt6TA=
X-Google-Smtp-Source: ABdhPJwVJrvYRS4QNUGkZShFwfRQXEjfTjQiTnlk4ZMv2um5QMKFV+eMMFvgX7QkyeiQDzdjefYDsA==
X-Received: by 2002:aca:d60b:: with SMTP id n11mr15506901oig.110.1606753837593; 
 Mon, 30 Nov 2020 08:30:37 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id t25sm8951804otj.13.2020.11.30.08.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 08:30:36 -0800 (PST)
Subject: Re: Inspur's CCLA Schedule A update 2020-11-27
To: =?UTF-8?B?5YiYIOmUoeS8nw==?= <liuxiwei1013@outlook.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SYBPR01MB522681DC2F59BD6A5C79B013C5F80@SYBPR01MB5226.ausprd01.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <23fe6020-b93b-0c1d-636d-9eb810b5f4bd@gmail.com>
Date: Mon, 30 Nov 2020 10:27:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <SYBPR01MB522681DC2F59BD6A5C79B013C5F80@SYBPR01MB5226.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?QmVuZGVyIEJhbijnj63ljY7loIIp?= <banht@inspur.com>,
 =?UTF-8?B?TG9ubnkgV2FuZyjnjovlhbTpmoYp?= <wangxinglong@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/27/20 1:52 AM, 刘 锡伟 wrote:
> Hi,
> 
> Please find the updated Schedule A of CCLA from Inpusr,
> 
> Please help review.

Done, thanks for keeping it up to date.

Kurt Taylor (krtaylor)

> 
> Thanks.
> 
> George
> 

