Return-Path: <openbmc+bounces-645-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED8B56F9D
	for <lists+openbmc@lfdr.de>; Mon, 15 Sep 2025 07:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQCgd5zKQz3d89;
	Mon, 15 Sep 2025 15:06:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757912813;
	cv=none; b=HQDs5o/fDziyufE8KOyAGsSPPKWkn9WuwvHXDt1udOea20m41761RG3J7w3XZ3lYBUVt0zGOuydPXlxmWl5ZTPaaugOAFUkelqyqA0CD1aJc8PhQGseNjfnf0DPsQw9dbS2UT0i3UFQIxi4tEPmv6HMB8HAy4lAXuPXY5dJcHAzX56rsjwzv8FWcW+jnOD5Qgn+nrhJrGw5ta3pK8MaChKrBgcOvd1vuih9OQDNKexEBogLUndUHtXMpsKs45QvoMZDIYjdLXJd152rwTeZVsCvzof6XBHPfOaCn1P1YhvnVvTXP1AaYFoqu2n2YGOTVpEAzduF1r8yuP+5OvLyd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757912813; c=relaxed/relaxed;
	bh=oNMOaL81IkhElHKr2VApsXrxfwnHiJNxSJBV5ekXwTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMIYSNUSD94AJRcOvzZox1vAxaYhJfN/umhcUHlDkU6kdwDlrP8NYBeAbBwh25OQ8kdrwKng8FkalZ5iKBaS+6YABSvrAjrpJ9RdmLbKJxxk/8lx+AzF8jJpcjmftxar1iPwNxGZ55lfnJVxBFwjB89TNowLRCRA5YupuCRmJu1QJ7n1kI7R8U3LJ4GsuXeISqDzXH0iEqpzOIzr3VeS4qJoSvnT2uEhkGS0QoL7JuUZPyPhUbzP6wS+c0K19sQSAwBzeRo2tV6Rv37hI6LBr2jQoivsPOaohTNqUJvsNPynFLJUTZo7mmtiLGWaEqFvScMOK9NGir2L28CDClFkyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bwExPnFd; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bwExPnFd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQCgd0Ypyz3d44;
	Mon, 15 Sep 2025 15:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757912812;
	bh=oNMOaL81IkhElHKr2VApsXrxfwnHiJNxSJBV5ekXwTA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bwExPnFdRLkhCTTi+hk/aoWc+gY5XGZePQgDQN+4nim/C8quuZxzvEFZu002gI0rH
	 9MQhVepzXwruhuA5KoAaeQc1UVV2xJ40DoOw7W6aSSAU39KsCncmJCpaaUbZo6Vhqg
	 /IWyQZ0XW1SBb4NrMgUYpB+Z6F7UQuFy9gpVrgCP5ChIKmMztJMLz8FrXlEoK/OX0M
	 R6Vmg4eHGafzc3EEDbyG3WGrF8dkPqJERJ6wqUddiRub+QPew+DrAs2qpMgSmaY9Yf
	 /13wRgEQSpA7Yf/i1nm+adpnqT6V8yB1yH/BQFxjL8qyojo0YjyFdbOZ+DasjGATJg
	 ljuHfKM4dmbVA==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1C9864CF0;
	Mon, 15 Sep 2025 13:06:49 +0800 (AWST)
Message-ID: <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 14:36:48 +0930
In-Reply-To: <aMatZAX6eFI1RmDH@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Brian,

On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> Hi Iwona, Joel, and Andrew,
>=20
> On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > appended to the "under-the-cut" portion of the patch.
> >=20
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
>=20
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.

My (strong) preference is that Iwona applies it, but I'll keep an eye
out for any unusual delays.

Andrew

