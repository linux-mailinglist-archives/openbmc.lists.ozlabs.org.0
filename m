Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE9D88BA
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 08:43:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tN6D3yVBzDqX6
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 17:43:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dLoY8ZgM"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tN5X6V4zzDqSq
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:42:38 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d22so10797554pls.0
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8e/phWg64bJlG4OuyLrWt2BBWqBDHdEqjvS5+gW0+4w=;
 b=dLoY8ZgMGoyDzmyTuDrLgGeGDMRchlAzrzVdPwA5UggLkqV25xgE9YWPAMDrqNgP0a
 owzhwMUi4lqyzhFPNPwS1KLCRgXx3mRRQ4/Tfe0/40S6CLvmtliwTzvGGAxkyUoThvTW
 NnsN/5RR9u8kaG4nRxOWTu+2T72SHuiYT9EW4KAiZmFh+cGSfzrUwRda9MnFKG7zwFG1
 2eV52LsQ5kRZpuF6YmyYZ29AheZO5P2hYUviZ8PgVTjo6Akxl/FZZ4D69mNnWJR4bVu6
 G0cZI8o3fFmnQjWkWa4kfDs3U2Pu6v4CxKzyOpm9EJCkzye1zUVV+c6iyvwqIPy2L3Dp
 49FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8e/phWg64bJlG4OuyLrWt2BBWqBDHdEqjvS5+gW0+4w=;
 b=e0iFcjky85F2RMt3iFDbC/D2gWAUoc9G3wtu+ZFQPAZ3E5KA2tKB7Skg/s1NIv4/0+
 +/vJNV8n7PzQMQUbdzBR38V9LDbN/QMiK3xx0QfQuzx1nOJJqVe5RhytfACQQqp+1Zzo
 2Ze1I66VRBEIVIYBSl14wkqoKgbinuPeyND+hhMsvCMJstU2GYVFYQhnvkJLZHlg9yb1
 WJYhBuVcfm5yvxe7CyOIeTh7438G+vwO6Z73MX0bttxT7KHaWb5ZMjFrO7YsvnboBWza
 xwDweiu0zbg/LcW7RKt8OJiabo8PBRkxjY60f5vs38OwAuX4YTgmd99mCb8YkFA6OmNr
 67Jg==
X-Gm-Message-State: APjAAAXEVszBANeKqGwcj+c5rBqABxYNiUuwmIslD/oYms0157JgoCQy
 qCUjI7Ze9RaGeiurQ1HZvPHBlhGv
X-Google-Smtp-Source: APXvYqzd8lvhXM2lT5sWSzs8n7dnNRqfoaTNTZzVNCYrZjlmG7hGfX44mLK8KsxUbWkpJgvmC3kpdg==
X-Received: by 2002:a17:902:6bc1:: with SMTP id
 m1mr39917972plt.67.1571208152589; 
 Tue, 15 Oct 2019 23:42:32 -0700 (PDT)
Received: from [9.199.76.54] ([129.41.84.82])
 by smtp.gmail.com with ESMTPSA id e6sm32192210pfl.146.2019.10.15.23.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2019 23:42:32 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
References: <9d545616-c9c2-1f83-efd0-44769ea2d994@linux.vnet.ibm.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <1dd7c224-a708-9c81-8460-4a24a738e5f6@gmail.com>
Date: Wed, 16 Oct 2019 12:12:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <9d545616-c9c2-1f83-efd0-44769ea2d994@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 16/10/19 11:47 am, Jinu Thomas wrote:
> Added eeproms for the below VPD devices
> - BMC
> - TPM
> - System Planar
> - DCM 0 VRM
> - DCM 1 VRM
> - Base Op panel
> - Lcd Op panel
> - DASD (All)
> - PCIe Cards (All)

Looks good to me.

Reviewed-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>

