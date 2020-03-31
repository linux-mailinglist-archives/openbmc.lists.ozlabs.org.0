Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4A198BA8
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 07:23:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ryRM6TDqzDqfC
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 16:23:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ryQq2XKpzDqX8
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 16:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=v7aoi/QX; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48ryQp5557z9sPJ;
 Tue, 31 Mar 2020 16:23:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1585632194; bh=SYBU0jDGQxCTgYRk+IMBPJMB0a/eUgCZ/Vy6xps51TI=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=v7aoi/QXUMZigYU5jSfl/O0CKl9qXxAWU5GEE6DJZv921ngVRdHpp4R6Me1gnFPy+
 uOJ0kL13eZKI5Ah1jEH8xg7DFjmPS0/DPlRi7DoXdJFT5aOFLr0/2wjZ8I1OmaG7xh
 TYu1VDBhym2vabyI+KuY/YAjL9gYaQWQLRYBtW8XasBBvUyAdp3AVefN4EyhPFBcgP
 h5dYVP/FaqZwo/NfdnVW5di+oaqAdyky4dJHKA61AwpQTVrTkq1hEVSchweMXos3Eh
 g9RMw8Ptp+tBEwrzFDfHAzqHe74ClwyL+4ma3p+LBihm4GZsGPA3k7vTM9ZJ5X+Voy
 8dMqgiheP/vcg==
Message-ID: <9cd51cb31c98f3ca8c4dfe46656b0dd239bf350b.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.4] fsi: aspeed: Enable 23-bit addressing
From: Jeremy Kerr <jk@ozlabs.org>
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Mar 2020 13:23:14 +0800
In-Reply-To: <1583953450-21660-1-git-send-email-eajames@linux.ibm.com>
References: <1583953450-21660-1-git-send-email-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

Hi Eddie,

> In order to access more than the second hub link, 23-bit addressing is
> required. The core provides the highest two bits of address as the slave
> ID to the master.

Looks good, this is just the reverse of the encoding we set up in
fsi_slave_calc_addr().

Acked-by: Jeremy Kerr <jk@ozlabs.org>

[I assume that the opb area is large enough for the 23-bit
addressing...]

Cheers,


Jeremy

