Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB924E32A6
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 23:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMqBv04wFz3bNB
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 09:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JZaLni9n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JZaLni9n; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMqBX5lNGz2xgX
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 09:32:52 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 757FB113;
 Mon, 21 Mar 2022 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1647901967;
 bh=r4WfNG3naLSNSTH3OBiFqFDpGWTK1IXv86OvRgH10fE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JZaLni9ntUONhphJ4aBgcdP+8Gzhh9K7hIuy/QQZiKY+0zXguJRz0ccqKZJyWqi7d
 /Z/OkLBd+MGcXdNPbW+A2F+P8TcfWnZDoXpdyOgBs9RDlu/koEDbcFhniCLTY6Qgcb
 sDXjCDg4XQAKNvV+xGrU7sUjElNDkaxX4fJE23CQ=
Date: Mon, 21 Mar 2022 15:32:43 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yjj9C5PgBfgmXyp7@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
 <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
 <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
 <YjRmUokDFPezGI5B@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YjRmUokDFPezGI5B@shikoro>
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

On Fri, Mar 18, 2022 at 04:00:34AM PDT, Wolfram Sang wrote:
>
>Can someone give me a summary What is the status of this series?
>

I had been hoping Peter might offer any further thoughts on my last 
email regarding the feasibility/proper approach for implementing some 
sort of automated avoidance of the problem scenario he pointed out -- or 
alternately, if we think a written warning in the bindings is 
sufficient, I can send a v3 with that incorporated.


Thanks,
Zev

