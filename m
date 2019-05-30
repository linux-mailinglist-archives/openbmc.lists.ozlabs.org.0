Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEB2F8AE
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 10:44:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F1N72WwrzDqVZ
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 18:44:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F1Mb5Zj4zDqV1
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 18:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="SsUI2moU"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45F1Mb2qfxz9s55;
 Thu, 30 May 2019 18:43:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1559205835; bh=WpFhUgNZrszD1/2IvHde67Ml85Lw/bjmJ6or+MMCA3k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SsUI2moUmzV3gaG+a1rocFPHVK/u+RHIYQnFqiOPjgeTQ8X24T68d/povkfDnf+hc
 kJIW1L8YWlODA0IYJP3NcciBF+Tmu4xVTxeA/FMVf6vSz/Y/eZJ0S3riRvKUmNTahY
 8nZraO0B6YiOOcuLxuET58joat1OeXn1qQ0yNbbCNJBXVZVQ+6Z9bfurLvinohPGUM
 l93KmtZg245E+/Je0UxBZTEkDtJ0sG4WkYajB0qXfn8f31hFMNX1Z+Aa1EbqAoLMQa
 VtJPwg/TrFRHY4hjMCj4CalYxrejpynqgFIpWg8ljIThkR871hgljApO1GJ0h1Lou9
 yLLUW1hPPNxAA==
Message-ID: <1ca8915ecad78c8089945cba6a9d1a7e86fb0147.camel@ozlabs.org>
Subject: Re: About performance tuning of jsnbd openbmc
From: Jeremy Kerr <jk@ozlabs.org>
To: xiuzhi <1450335857@qq.com>
Date: Thu, 30 May 2019 16:43:54 +0800
In-Reply-To: <tencent_0EB4C77C03274CE710EE5B37@qq.com>
References: <tencent_0EB4C77C03274CE710EE5B37@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Xiuzhi,

[CCing the openbmc list, as this is relevant]

> Hi Jeremy,
>    I am trying to  install Centos7.iso image by openbmc nbd-server.
> The performance is too slow to install the OS image . The speed is no
> more than 40KBytes/s. My network speed is 1000Mbps.
>   The speed is up to 512KBytes/s when the openbmc nbd-client connect
> to the  nbd-server of nbd3.19 which running on my ubuntu 16.04 PC.
>   What factors affect the transmission speed?
>  How can I improve the speed of nbdserver?
>   The attachments is patch to webui and phosphor-handler and
> nginx.conf(I user nginx as the webserver instead of the  bmcweb)


I see your client-side javascript includes this:

+                server.onlog = function(msg) {
+                    $scope.nbdslog += msg + "\n";
+                }

- I've found that the logging like that (appending to an increasingly-
large string) can cause fairly large slowdowns.

Could you try removing this and see if that improves the speed?

Cheers,


Jeremy

