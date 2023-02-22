Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09A69EEAF
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 07:12:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM5RH6kKZz3c1K
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 17:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ImyQn7ke;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ImyQn7ke;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM5Qg2K2sz30QS
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 17:11:53 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso7654528pjb.3
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 22:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ruv2Y8KsHpon0qzIiBrXyvsLziMWd4vDNUJjmSu/28=;
        b=ImyQn7ke/a1fgkyigufGb8BqQkJPB/5QdBqW2k9woMujWikK4YanMSpJ7iiiumcB8D
         yR6wvm7oQfAHyEl0vQRwZNzXVkwT/fKByYe8QHakl2H5xLx9vY6KDpDa33WYS/xqFq3x
         AC1C/OWqRdy2ieoUVwMmTyI8PtFDhuc06os+g+LFY2VrcVcTSB3tWd6mKMcD2b4i7T9s
         VL6LitlG0+LOBfHsItITrxLifBW2b7/e+/OvPA0tD6zxcPLjt0kLLtLyIQlnmiTVPSlU
         O0W05goE1IaJF6/nMfJxZKINQLhl+vj9v+79y7yaYNXOd0SLmeX+enm8evk1/o4SSuJE
         Vebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ruv2Y8KsHpon0qzIiBrXyvsLziMWd4vDNUJjmSu/28=;
        b=Jln4PNDVjjxGg1ZoudiZXukRfoFT8VGNN/+MRwjPS2Q3su3wj90vCJEmPnaGare44L
         LYfpnx45oPtIOr8L3+8crOdMqZ0XZ+9AJRRCgIsf2lvzZ7cJh0OA2Huud+zM6YXPyFtu
         Fqqi7VGz83lkOC33MNc1wVDWHysetTIG8HtcQcujD4S7wTXRDbQWvRusFJWiYgj8weUy
         lDWRM97EZ2zRj5oCG5L4LUsAYXITrazjQBcwngAPToXYU/MhXrDBlYBwDzswolpXOaNp
         1xQrg/PhgMcm01w4JVE5Qy7eZSqGtq/qi9F+AsPLDH5pakwqD+KEC1JfYKsFxzWYPN8n
         6q7w==
X-Gm-Message-State: AO0yUKXzmU7HIShGfnHUkBpUSST1lOBZcBlprDGbL1QDXz8T3esF42t4
	7vk/eHY1o5Ae6hyeuXSpPnDjHd3Q/fs=
X-Google-Smtp-Source: AK7set9W0tyQ2UWBNbWxDYXCNs+cDjuPzYoL17X8BpDnCaVlsb7NMiYnqww9Ei6SHMEa1L9bE32DiA==
X-Received: by 2002:a17:902:fb48:b0:19a:95ab:6b4f with SMTP id lf8-20020a170902fb4800b0019a95ab6b4fmr6400386plb.61.1677046308863;
        Tue, 21 Feb 2023 22:11:48 -0800 (PST)
Received: from fedora ([76.132.59.39])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902a9c400b0019c904fd55esm2676236plr.45.2023.02.21.22.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 22:11:48 -0800 (PST)
Date: Tue, 21 Feb 2023 22:11:46 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: OpenBMC Linux 6.1
Message-ID: <Y/WyIjpX/T0g9RdP@fedora>
References: <CACPK8XfAtPfUxBP92iwqRpnaRgP=51_SyuYsxCrpk3MQ9do6WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfAtPfUxBP92iwqRpnaRgP=51_SyuYsxCrpk3MQ9do6WA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Thanks for the update. Let me move some Meta/Facebook AST2500 and
AST2600 Network OpenBMCs to v6.1, and will share my findings later.

Besides, could you please share your long term kernel upgrade plan? For
example, are you planning to align with LTS kernel in the future? Or the
ultimate goal is to upgrade openbmc kernel whenever newer kernel is
released?


Cheers,

- Tao

On Tue, Feb 21, 2023 at 09:47:18PM +0000, Joel Stanley wrote:
> I'm moving the kernel tree openbmc uses to a 6.1 base for ASPEED. This
> release is
> supported upstream until the end of 2026, which is useful for anyone
> looking to stay on the same kernel version for a long time.
> 
> +1 party is here:
> 
>  https://gerrit.openbmc.org/c/openbmc/openbmc/+/61083
> 
> I've tested this on IBM's ast2600 based Rainier and Everest platforms
> ("p10bmc"), but further testing would be welcome.
> 
> There are 91 patches in the tree, with 38 of those patches not yet
> queued for merging in v6.3. Most of the patches we carry have been
> around for many years, and are changes that no one is working on.
> 
> If you have bandwidth to work on the maxim fan controller, or the
> devmem kernel command line patch, or upstreaming the xdma driver, work
> in these areas would be welcomed.
> 
> Cheers,
> 
> Joel
