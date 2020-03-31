Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8373199A17
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 17:45:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sDFB0wlPzDqQ0
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 02:45:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WRpjx01c; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sD9L0CNWzDqTj
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 02:42:29 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id r14so8015931pfl.12
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KDuAtBeu4SFY4sw3CxQAeDAq4uGk1/P2qv0HzJwEFlU=;
 b=WRpjx01cpOolF5J2y/dAVjyURXCWKzu2jJsCj290P6+4pAov6zJbViFRZ1fzOlUneD
 tH3eXVSUEmKT9lZ5HAqCTaDgYmMfWiHgUIt7WNAhK0+NMDR21ddqZy09BozRY/njfcVX
 oBvdfl/Wf7B9I4dD/v/hmqDhiJVpCBBT39mcvpsqMElY9nScj3/unELgfVxrqKgOsXoy
 X74Yk67wDwl8f2qf27V8zVXeycyuIBQpmwFZuyaRx2yCBfDFGCJfy/DvTB2i95gL5i6y
 TLGsYLK31OnXg2YsRJqIFhPn4TzNgvA/Bv2YBX2nWv75lPEZW97Wlvh3FWjfXX4Q9QrH
 EBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KDuAtBeu4SFY4sw3CxQAeDAq4uGk1/P2qv0HzJwEFlU=;
 b=EekxNfyOherSl6tFU+3PY1UtgBck+3ZepEFO/6HuyL1hk+vi7T9OLHbAq3KQ0vBjka
 Qae3YZyPhWPZ7r0dVndLsmVoO6E4kiGHUqSqDhgI3kx5IZaCK9fHovMxi4DhiGnLgQDX
 0k5zH0PSobbs8H3qdoS9Ts+U8o0/R8fbHq5MwBiVDT9q3J71peUi4H7FuDqBc9TaAFQn
 5zxkFytErO1aoGeJC1Qe578D5DSavmKDdvcy53BerhcqoHXO0TUnOjS2dg9PoET44zVf
 flxUwKtfBeCFzJ4QqjIRkSsbT53rfvxU6H2c9sOwJ2MnkYFbvLYBTASXwdemdypvggCB
 eRNA==
X-Gm-Message-State: ANhLgQ1FzAn44xuELL/I3K+7EXM+fKNJi/0iFqab0Zc02qn9xHu+YZ4x
 SzH/XtW1R+HtBboNH29+Jx4=
X-Google-Smtp-Source: ADFU+vuYuJFEjZbk+8RzKG2Sw2VrFMI+77eghzMHaOXXYjsecX+mY4xs5y+UkncebiilTzlanexRFQ==
X-Received: by 2002:a63:b40d:: with SMTP id s13mr19347404pgf.268.1585669347008; 
 Tue, 31 Mar 2020 08:42:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g69sm2183675pje.34.2020.03.31.08.42.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 31 Mar 2020 08:42:26 -0700 (PDT)
Date: Tue, 31 Mar 2020 08:42:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v2 2/3] hwmon: (sbtsi) Add documentation
Message-ID: <20200331154225.GA11562@roeck-us.net>
References: <20200323233354.239365-1-kunyi@google.com>
 <20200323233354.239365-3-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323233354.239365-3-kunyi@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 04:33:53PM -0700, Kun Yi wrote:
> Document the SB-TSI sensor interface driver.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> Change-Id: I4b086a124d1d94a516386b0d2ff1cd7180b1dac1
> ---
>  Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++

The new file also needs to be added to Documentation/hwmon/index.rst.

Guenter
