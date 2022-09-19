Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D05BCCB0
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 15:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWQ9C42mWz3bbm
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 23:13:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jMG8Rgx8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jMG8Rgx8;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWQ8k0rHGz2xJ8;
	Mon, 19 Sep 2022 23:13:09 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id b21so27871075plz.7;
        Mon, 19 Sep 2022 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=0SWMd1/dw8viGWJFir8vLYI252YhXo7+413gv8lkrKM=;
        b=jMG8Rgx8ILPtFbAjdCC4Oe0jdG8QNs3SVz0BOWN+HAc9kuR5OgpDh0ltIcULvcKhLu
         w4l9YzHCmEeKMToMayC2GPlTy2by5Lhq+5Rvj30ROI2IQV4tO0767bceYwZcV5Aq4WaZ
         Y4O8qSnweUBXAqrq1/CVjLfsjoHJJNstfTQ9sPJ5/cUMlQ1toH743LwszvLC4X/oLA3T
         2Mv+4flaRZYOgxQPetntXpf7kmTvLA9cRr2Zj/pANw0SGna44AwiXrmOAuptz1onbSJ5
         R6DNI3+DTFI7iZ8ZyE4Hb9brVJDZ1OfWvFCEowHFgHd5TeTkoTwC+VzhDQSvRPmpOO3J
         Dlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0SWMd1/dw8viGWJFir8vLYI252YhXo7+413gv8lkrKM=;
        b=UfTpTyCLe4b3dmtolAJG4LRqVbPHNMxa1qxf/OQ8vrt38DD2XsDGh8wlT6GUZqqsgQ
         phVXYgrB6H7aUbu23zjijhAW/gHOah1xNcpm9eL3WYGOXCWeJlEk32qgIGZLDqzPBiYq
         VqtbnSf2LajcXlmHJuROCzu9hfTuauNDJu3zf5+XKBRR33W5UabdBNrrejo5faO3gnUW
         wH/0njaNOHcoSkeqXxZ2KL0teoHi2dP/b4HEoRW0JXAttofLw/L+M1+Wg/QYC5447Js2
         AiwWL7XeAJXyFjYVp6uQRRknJCqSni1tyoOEELucm6G5pR8N7uY/vbJoNyJfQym5kvFL
         nNDw==
X-Gm-Message-State: ACrzQf13XybW66thcbHlWT80xNjLTJZoyqPDLRGdmAcQPidBJ2zs4vpz
	MjWA0mIFCpjGAKAJceIjBGg=
X-Google-Smtp-Source: AMsMyM5KLPsJwaIa/7tRyTleFbZdQl88/wKqOzR2JZQawM2ZKcrErncGQOcA/vlHqwiyYs+Qzw5CDw==
X-Received: by 2002:a17:902:e550:b0:177:f115:1646 with SMTP id n16-20020a170902e55000b00177f1151646mr13183688plf.112.1663593186365;
        Mon, 19 Sep 2022 06:13:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902784200b001754cfb5e21sm20625912pln.96.2022.09.19.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:13:05 -0700 (PDT)
Date: Mon, 19 Sep 2022 06:13:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Add dependency on ARCH_ASPEED
Message-ID: <20220919131305.GA3545921@roeck-us.net>
References: <20220916120936.372591-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916120936.372591-1-pbrobinson@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 16, 2022 at 01:09:36PM +0100, Peter Robinson wrote:
> The SENSORS_ASPEED is part of the Aspeed silicon so it makes
> sense to depend on ARCH_ASPEED and for compile testing.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied.

Thanks,
Guenter
