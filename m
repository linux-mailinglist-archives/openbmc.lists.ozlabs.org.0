Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8860E3F3
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 17:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyBnf1llCz3cD4
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 02:00:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eUKReRdP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eUKReRdP;
	dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyBn45NkFz30Ky
	for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2022 02:00:07 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id g130so18811441oia.13
        for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txXT/wKuP7e6vmu341lu5ocYQu6nOYOzPylEPZrz0ao=;
        b=eUKReRdPe5/6Wf1hvfzbtzHbxaDKbWabbo7VhS5Mw0W4Oyb7vlrOoUuM1n4Ccjs41i
         CnEVqPzAY3qS/QzZgNB9cilk2SC2d1QODWsOijmjWRqKtPEhBVJHlCT/madDQQ/Njsil
         OC4yvePxJKytlrH/4z8aN62RcP556W9jOz7sedI12lhEvtPRE+9F1qmwjTj3bRj6pCfT
         oV7UrOISfNJUtn74TjL/bBnq/8o5/KamvzmV+5yG0vtb/sfcBoBnmDjoZ9safWks4SsL
         rUBPIGatBcJx3vffkAFxWztkVN4RD1PutoreQEZxIqwIJ/qD/B580LX8JaSjBRuRCEuA
         EKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txXT/wKuP7e6vmu341lu5ocYQu6nOYOzPylEPZrz0ao=;
        b=WOCK7v715cOmAo6sca1QRTjHYQUzWe3CWSUOsSpz2LJPkxQUYn1+F7rIg8vqIwnOA5
         SmRd6V4JYzW7HggCNFhNyxbCTPjGte9Ipy5ZbPVfa2g1eRifh2QVqsB1mkwpV0hejBzU
         4IjaDDBy4eaGT0cNMSBt3LlkpoUu1wvEZ+VrS1CeKRIKbbOkGfL74+4x9dq88AqjnPxY
         yA0pDZpAw2kTWfy9hiTnjVSdwJ55mcXrQb/KcdIcNRnhvSuhwQuimY5c0aTXpffit5jl
         HJVvU4tU/09i2hYUDQ+4V1UAXfYs8kYsxezNX2dLlJ0kqjcVUvi5/eB6x8bbFtuVwamq
         J4Wg==
X-Gm-Message-State: ACrzQf3ChMUU1fjpJ2JV+iazX5krqXty8+eRysvf0XhiOBInguSiNX+b
	H4QChpR3tmQrpuir5ChQ1rE=
X-Google-Smtp-Source: AMsMyM7Boz8EiNGrugjMh/1o3LveBg7F50E5TXO7Q+5hoDFb4+nzDkAPU6DBuPcT107b8EUDsqUkQA==
X-Received: by 2002:a05:6808:23d4:b0:354:e81a:12a8 with SMTP id bq20-20020a05680823d400b00354e81a12a8mr2083674oib.78.1666796403179;
        Wed, 26 Oct 2022 08:00:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w110-20020a9d3677000000b0066227572ee3sm2265814otb.52.2022.10.26.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 08:00:02 -0700 (PDT)
Date: Wed, 26 Oct 2022 08:00:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon
 driver
Message-ID: <20221026150001.GA2545504@roeck-us.net>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-2-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 04:43:13PM +0700, Quan Nguyen wrote:
> This commit adds support for Ampere SMpro hwmon driver. This driver
> supports accessing various CPU sensors provided by the SMpro co-processor
> including temperature, power, voltages, and current.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I see that the mfd patch was accepted into the mfd subsystem,
so I'll apply this and the next patch in the series to hwmon-next.

Thanks,
Guenter
