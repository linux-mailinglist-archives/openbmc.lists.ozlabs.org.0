Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208B1E79D9
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 11:51:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YKZp0JsJzDqf9
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:51:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RqGJS3FK; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YKWb44WDzDqSt;
 Fri, 29 May 2020 19:48:27 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id f3so1037323pfd.11;
 Fri, 29 May 2020 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mPpjYDtVNFbOV3twkT62l0LyftrjpV9lJs5FQ+hBUJY=;
 b=RqGJS3FKuMyWpu1m3Hzc6I4POBM8lESMPYNIYKWdGRlvA8Kh4IUyw7F0hympeVZpd1
 yXWiFtzPY6j5UXa/C+hrN8clyWYIa55Iia4MqyCMWOIAKyuA8D7fPpKzOnHCb9wTJo+K
 wuYYrIN+1Uebl+YzdTKfCzPq2JRfKJAztns+u5u6kveazJvE361p23B2baTzk8oLw4rV
 O4eJ2mXLljPox04H1Jle4G9dzklK687lj4qCHFllOTt06dkwa7EWVHPslOjSUmJwpZFv
 JcegsnotpcOIrh168sH42B+nib3cjDhdNcgap8Abs7up2U86YnRPYnWc4twOvdKA2ZgT
 bJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mPpjYDtVNFbOV3twkT62l0LyftrjpV9lJs5FQ+hBUJY=;
 b=GXpWkXMbwRrE07PN+R0pjKj/6kJi08/9Z4BPS53paXMtMapAWCIdhDbtsUjhWsi/6A
 uPf9Y58tay9ORJjnx98rqsMxEv989yn2PfJG8sefXVBf6faUWAzfCoD+4/xG8U2BMwWU
 pJ2deYXn67KIw7fwf8OHIvbO1GsJX0P8iUOcHfZpTguvyRBbRkM3PblpjGgq6DnmMMvE
 7iSIQEvMOsGjmvNZMxEdOan0loSUinKfyHlppaB77gAxxCqbxBx7pxlcXMp/QBzEHsMB
 ugiQHHER0Qw+53oHJu7T03Zz3K5j5J2H26/fzjGrB5LdSLt6ulNBqCcCe5krppHuriC7
 1TRg==
X-Gm-Message-State: AOAM533w0eOP3+s+2o61kl6g2CWj3I+iJI8/Ucx8VpsZkQ/XXucX6l0r
 UmOSkBotpnHf9h/RjT0ibjA=
X-Google-Smtp-Source: ABdhPJwWITnuWJvg76c3WAVB8NAsrXfY/9PtnbOchm4AlaChuKqAL/wfFo3hfttRROrUzG84B3Dqgw==
X-Received: by 2002:a62:7610:: with SMTP id r16mr1467560pfc.70.1590745703981; 
 Fri, 29 May 2020 02:48:23 -0700 (PDT)
Received: from cnn ([2401:4900:2654:9f89:a888:ed6a:9872:b822])
 by smtp.gmail.com with ESMTPSA id i22sm3987421pfo.92.2020.05.29.02.48.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 02:48:23 -0700 (PDT)
Date: Fri, 29 May 2020 15:18:13 +0530
From: Manikandan <manikandan.hcl.ers.epl@gmail.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200529094813.GA29323@cnn>
References: <20200528141523.GA8810@cnn>
 <76D2694A-C80C-49F8-B51D-8A74341CA4ED@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76D2694A-C80C-49F8-B51D-8A74341CA4ED@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrickw3@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 28, 2020 at 05:34:22PM +0000, Vijay Khemka wrote:
> 
> 
> ﻿On 5/28/20, 7:15 AM, "Manikandan Elumalai" <manikandan.hcl.ers.epl@gmail.com> wrote:
> 
>     
>     The adm1278 temperature sysfs attribute need it for one of the our openbmc platform . 
>     This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
> 
> There is no Signed-off-by.
>     
>     ---
>      drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++++
>      1 file changed, 15 insertions(+)
>     
>     diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>     index 5caa37fb..47b293d 100644
>     --- a/drivers/hwmon/pmbus/adm1275.c
>     +++ b/drivers/hwmon/pmbus/adm1275.c
>     @@ -681,6 +681,21 @@ static int adm1275_probe(struct i2c_client *client,
>      			}
>      		}
>      
>     +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
>     +		if (config < 0)
>     +			return config;
>     +
>     +		/* Enable TEMP1 by defult */
>     +		config |= ADM1278_TEMP1_EN;
>     +		ret = i2c_smbus_write_byte_data(client,
>     +					ADM1275_PMON_CONFIG,
>     +					config);
>     +		if (ret < 0) {
>     +		dev_err(&client->dev,
>     +			"Failed to enable temperature config\n");
>     +		return -ENODEV;
>     +		}
>     +
>      		if (config & ADM1278_TEMP1_EN)
> 
> This check becomes irrelevant as you are enabling it above then rather than
> enabling it just remove this check.
     Thanks for review Vijay. I will submit changes in v2.
> 
>      			info->func[0] |=
>      				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>     -- 
>     2.7.4
>     
>     
> 
