Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85493D022B
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 22:32:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46npv149xkzDqRt
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 07:32:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="to94oEFR"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nptH435SzDqQs
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 07:32:06 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id i32so3612302pgl.10
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 13:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eG3/KTcN+l0J8/6h6CFjDe7V6XOLu3qvlhIP2AFfrys=;
 b=to94oEFRu7pxgY2G1Xez6EtBwR0f3yzChiGgys5tcUAprpjiFizEtLFTEfBhUswbwS
 +b6TW6lVGXl4mLAI4N3auzBq0yZMZCqptNh/Hrja7n2IfTO9vb/N15/IR8y0cnVkil3G
 XHH3y7a5zxQHC3wZYFFvm7Pqh5HXET1swlIRVWpE9Sywk5HGoA2nEoT+d/8bSrhOPgkA
 icePHEWyx6ekqLhZHjFp3fBjzhyj7hLulxxnd8XhpqLUycijtMwDhnxpgAq67FKnWR2y
 vdW6JNefJLtAVnRwzX/hGl9q6hjmdYUGPNbc/S+XjVI42xIfKYKlpbh7fzA40E8l+ekx
 UnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eG3/KTcN+l0J8/6h6CFjDe7V6XOLu3qvlhIP2AFfrys=;
 b=RjEqOBZG26oSW0xtzSYdIhKb797rh0lqP6yCUQo8Du52c6nxjExBg8qwjYx9kPmz3A
 p+iBBzA25nb1FWBMfT0FzYR5L94XuSu/ox5A3lmUpU3XCqE7Ii+r+GZTv2IQUTMbFnNZ
 ltwK1P1cAldolVGYoUMoVrRVZJfw9TtuwnH53UBX4rnEP1eC2/rBbttgGl3BCydZTJzi
 jUmYxJ1x5HVrtfMYRFsaVsE/AxjciJO6fbEzBRI/6peKL8WzaEePKh4/VXZA6OV9BdSq
 V7lvKG0pqUnByWRqd63GJKwgxRj6McJiORwDDKMNxUpEOoozmTJ08As3kAMiqJgjpvdE
 uTSg==
X-Gm-Message-State: APjAAAVUznoyIYdgqJlw9Lv17t8I4mqObtLeYTA7fWNO2fANNmyRM9kN
 7KvesSwS+uTxrUeV4Ra7bdciog==
X-Google-Smtp-Source: APXvYqzuXMuOJlcRChpjsyL5D5qPR+4R8/wPvf3J5IUiMHTYlcl02d8LMjqeowAKe6J+zFd5NRArUw==
X-Received: by 2002:a62:e21a:: with SMTP id a26mr6636688pfi.80.1570566723059; 
 Tue, 08 Oct 2019 13:32:03 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id r18sm16766pfc.3.2019.10.08.13.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 13:32:02 -0700 (PDT)
Date: Tue, 8 Oct 2019 13:31:57 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Message-ID: <20191008203157.GA184092@google.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> In case of master pending state, it should not trigger the master
> command because this H/W is sharing the same data buffer for slave
> and master operations, so this commit fixes the issue with making
> the master command triggering happen when the state goes to active
> state.

nit: Makes sense, but can you explain what might happen without your
change?

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
