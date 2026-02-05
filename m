Return-Path: <openbmc+bounces-1325-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIRlNytKhGk/2QMAu9opvQ
	(envelope-from <openbmc+bounces-1325-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:43:39 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07913EF879
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f68NS4yJNz2xrk;
	Thu, 05 Feb 2026 18:43:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770277416;
	cv=none; b=GNGN4Lpn1lIil6k7vL44spd0PvGgmVUL3ijRkVK5VxazVutgydckwmpLPM0y5rU5jR2RVSeIUqAnlZptspDFFZSkt/+0yND5pMpKDMC/JvAQBqzsEHvd66njSgc97Tk90F+BAsFyzeqLHlk0mj9AvLunSiD/VA1A+UFDBu/2xtxOioGtxWrA/bhjXbnt2gfka5pgcYpiEBFaXS/SMNcUx3F70PIxhmeXhD8v6LhlyaaiO0STfhONSjkoKloqwJZsfj3CdNeOryHlg2O6fzRL2NFCgFx9i/DNq7OlQNXcFHG2i4krpIeo8bI1e2zWGDFxJTu6L78B3Jck2Zi+uzGg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770277416; c=relaxed/relaxed;
	bh=kxAAsoCwSCWQ/fsyrWvwNOOGo7u767YkIi27jUP85K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCt8UXauouG5Wq8cFpQbSOeLlgwGhUX/gkkP4doL7gA22wp+JaA3hhfco5j2oVGbhnYtQATNlMUa3RXBX+gb0uEBg5hgOS9Onn1tDdaNaJNdvalJzxKZhKFFn2/p4S1Zrm/isodtbtCh0yysN+wBccEa4ZysXZhGmcIU8LYQt/VKwoRURXTH4ykyEDyJ7B9aPtItAEK/qxbh8etTooQaBBQ5DDI6lsg69bB+z83R+5td1sdUXj5IpxJChDZWV/vgsej3XPa5X8JREcReFtYkKovb2RIYxl5wytxIwt9ocjhRqTwINjpvCLjKlGaFwzUEfzwGXuLQ34x14UiWlKks/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qLSgS7EP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qLSgS7EP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f68NR06w6z2xg9
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 18:43:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B304C60010;
	Thu,  5 Feb 2026 07:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE149C4CEF7;
	Thu,  5 Feb 2026 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770277412;
	bh=jmTc98Ww6U1WEm7DhnUsuqNavBGcbSITF8l+RkaMFwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLSgS7EPfTvG1eNEc7J6aAsEz6Vmpw9HfoOjR3CBdepqtQ/Nm7EZPhBlCwpMIEW9g
	 AhAVANKd96p5nFOyHDi/MAttnDkt14a+jEx5glzJpwm/wLhW7PbcBBhJ4S/IGOyDqp
	 a2PCufX428/KIBfSfNlCgS9zJUxK+wwjOiTzb3EY=
Date: Thu, 5 Feb 2026 08:43:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entries for the Axiado USB UDC
Message-ID: <2026020550-uncle-bullfight-e15b@gregkh>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-3-45ce0a8b014f@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.80 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1325-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vmoravcevic@axiado.com,m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email]
X-Rspamd-Queue-Id: 07913EF879
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:16:30AM -0800, Vladimir Moravcevic wrote:
> Add the MAINTAINERS entries for the Axiado USB Device Controller.
> 
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 67db88b04537..e63b6b308a3f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4234,6 +4234,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
>  
> +AXIADO USB UDC DRIVER
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained

So you all are not paid to look after this?  That feels like an odd
business decision of your company, but thanks for documenting it
properly :(

greg k-h

