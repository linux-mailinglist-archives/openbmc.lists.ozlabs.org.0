Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B31100AD5
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 18:51:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GxMV2X0DzDqTl
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 04:51:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Twbd+l0m"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GxLM6lBQzDqc9
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 04:50:01 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id o12so5991536oic.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 09:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Z/x42pfsyMcSMpbXK1W/23N30szYKTJNXRFMySNvAYM=;
 b=Twbd+l0mqsrRX2oaX/e6HCNV2BcWaep5Lorn6jU3seltyD5yy/+yn/Kng/iC7Mhil2
 JWViCKIbI7uVb8/EDChFervi+XENqctQxTQqibbaBcTHgfT6hlxxPHAAAV+yO1NhIqfu
 kp9fzYCdsHZnTzv0N4M7jh4+8+CWeEqAq90BH4aNKaP9UdP84pAPhuosCbsGjKmeJsjD
 cN+Cu72TYXuNgwATN5PfFAcXqRlFYrrwyhptYvPXG0rSH9C74PkLlPwhqV3/OAGdEVN0
 yK3MuNNjDPCBc44+rqOudOJG6vaLXhxDJndJnM9on3A19EibmAfU+CxVZKIZ6/P2WLYr
 7QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/x42pfsyMcSMpbXK1W/23N30szYKTJNXRFMySNvAYM=;
 b=Fb4jYIui34iYgh2QBlm0Qkg61QDPqny4bKsJiqCnojIXjdhQVZnmVdsWzDeE+BlgkY
 W02XM3PtsRL0XfstofKZ9aN9FGe0Cmdp8jQhpxvHPpBSoZQ8BnDypttv69N3IwTL5NJe
 EsZMmLapy+Js4lLTcCO9rpaxLJnAfUiaObhi0/fCDSQp9vcaJNJ1UlsK0gy9oC+qbv2I
 9qmbrrz/SgR1Qb6KQxidjyZXqXcnG24BbZ+wVAoP2TanuL4eGqCL8J7pWZV0bqo04cCH
 uGo66925LGeVSSmfTYSF0Ok4Ip8hRfjeva6WblPxOoMKCTzJn9WiwpWLfHibmo15KRns
 YN7g==
X-Gm-Message-State: APjAAAUasVGK/p+EgaFD2KDI5dx8uuktHQxiZFqa+XM2nVzn9j6HAC2M
 /y1rmn1PDGcQwri8e8L2DqUvmuzZ
X-Google-Smtp-Source: APXvYqx/JoBKUMF6D9KoP6+NhBm6L8k+fah7x0/CGjyF0XzV7h0E3GN+xcsEZNH091HIJpHUQX0ZLw==
X-Received: by 2002:aca:ab05:: with SMTP id u5mr177856oie.28.1574099397382;
 Mon, 18 Nov 2019 09:49:57 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f83sm6232009oia.43.2019.11.18.09.49.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 09:49:56 -0800 (PST)
Subject: Re: Updated CCLA/ScheduleA
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <5A03B567-254C-4866-AA59-8C8EC5B833F0@fb.com>
 <24D563B2-C56B-4CCB-9668-0616CE7261CB@fb.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <45c2dd11-d5c4-c21f-f1b4-97901039783c@gmail.com>
Date: Mon, 18 Nov 2019 11:49:55 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24D563B2-C56B-4CCB-9668-0616CE7261CB@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/18/19 11:29 AM, Sai Dasari wrote:
> Hi Kurt,
> 
> Please find the updated Schedule A of CCLA from Facebook

Done, thanks for keeping this information updated!

Kurt Taylor (krtaylor)

> 
> Thanks,
> Sai.
> 

