Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C078B88F2
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 03:33:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZGT970MzzF59J
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 11:33:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="Nsd2d5oy"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZGSG6xQtzF58n
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:32:59 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id u40so6745895qth.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=4WJMMHDuZxH7H+MD/oT0vES1nWQCHy0CADTJt4JAwSY=;
 b=Nsd2d5oy3zJZ6+4K0fDPrZFEeWRHQCPNIL7xJqrVH5mwFhUoaCE5294BuSftfWTEfW
 FoneG6mhBPB7KrzuKN8pCBZTI9W/vsxR+BgBEGX54AXT27G103KuwXW4il+9makgIXjj
 3xwz5f6iDxN0l2rKNaRxmgLJYgfqAp31oqT7aI32smXSHEhZ1ZXD24s/BkwysXbDvsTq
 wCWzzEehWDoScsgYAlTxX+bC5O9qEn8NxQnCZxcfwaqgcgPFop4SVJxwHV6Gx2jN0XVZ
 0niXrJkhkCeZu/y14Dl0gKMt1i0wxBrVDKa5vCdHqbnMTNHn/mmf92xaRUXCr9NmwnmV
 QNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=4WJMMHDuZxH7H+MD/oT0vES1nWQCHy0CADTJt4JAwSY=;
 b=WEFlDos2KHr27n9nPSAhEpLbm1wOQVKkymiHan/Yii6etLb28qKAV5uFOL8ELttq6q
 YA8qDXqFhQMvhbDAFuPOd4eyDN2EqpcZLQKxogRoRNoHuNXslRPafDIGjgik2rWp0bK/
 5dBm6fgzp8SJ9Yw3yjKsKr3/rnojTB2HU4QBaroqDUQF5j8z+C1YaggCxiex0cRtwaWw
 U/GH3YQBvH9QcWiBBKVP6rdDeY0hU+QAgte3lA2++oNyN6u2fcUHFhnkjCAdc+Le2VrC
 KjJ7X7J4bunl9Qeo4vw9EF8Zi/c/DL8Dn+3vljgnUpudbnfEiYwKL+gyIG3BgoPBY3NC
 UGlQ==
X-Gm-Message-State: APjAAAXO2dp14xfQTmdclGuAyw/FW09Z2nQEiOGuKHO6AcNkU6J093eO
 8M3TOEvjrcgNNLNSHoMuBi5moQ==
X-Google-Smtp-Source: APXvYqzdTUjTpFbUoVoc+ebm0vlKwxHAf0leKDBwPoI+8ipofZyrSm/CRN202t6ONi2mShSkv3jh9w==
X-Received: by 2002:a0c:946f:: with SMTP id i44mr10787876qvi.133.1568943175743; 
 Thu, 19 Sep 2019 18:32:55 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id 54sm227866qts.75.2019.09.19.18.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 18:32:55 -0700 (PDT)
Date: Thu, 19 Sep 2019 18:32:52 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] net/ncsi: Disable global multicast filter
Message-ID: <20190919183252.5cb041b2@cakuba.netronome.com>
In-Reply-To: <20190912190451.2362220-1-vijaykhemka@fb.com>
References: <20190912190451.2362220-1-vijaykhemka@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 12 Sep 2019 12:04:50 -0700, Vijay Khemka wrote:
> Disabling multicast filtering from NCSI if it is supported. As it
> should not filter any multicast packets. In current code, multicast
> filter is enabled and with an exception of optional field supported
> by device are disabled filtering.
> 
> Mainly I see if goal is to disable filtering for IPV6 packets then let
> it disabled for every other types as well. As we are seeing issues with
> LLDP not working with this enabled filtering. And there are other issues
> with IPV6.
> 
> By Disabling this multicast completely, it is working for both IPV6 as
> well as LLDP.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

> @@ -1033,23 +1030,23 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>  		} else if (nd->state == ncsi_dev_state_config_ebf) {
>  			nca.type = NCSI_PKT_CMD_EBF;
>  			nca.dwords[0] = nc->caps[NCSI_CAP_BC].cap;
> -			if (ncsi_channel_is_tx(ndp, nc))
> +			/* if multicast global filtering is supported then
> +			 * disable it so that all multicast packet will be
> +			 * forwarded to management controller
> +			 */
> +			if (nc->caps[NCSI_CAP_GENERIC].cap &
> +			     NCSI_CAP_GENERIC_MC)

Applied, looks like an unnecessary space sneaked in here, I removed it.
