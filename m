Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8C7E77A6
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:41:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HG7dS9K+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNPn2TCFz3d8B
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:41:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HG7dS9K+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRNPD0pTdz3d9L
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 13:41:19 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso260691866b.1
        for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2023 18:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1699584075; x=1700188875; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bAjsVPWd/ehZqbe3QFdWIqnf2rx9TzDSke7v1bpYiZc=;
        b=HG7dS9K+FOr7P8fL+5iw59jrlv9sFu4gi9JkJKQLjqZiAgjVnFmxrU2QIslVv2wVOI
         RqlJdIu2Hl6dse6nfkqRen3XZ1dvAixMhD4QCYP5mzCrAzT5mJw6X+5prkYJ3HuRmkOB
         GlYJMGzR+USVwDTaubu5OqdZJ2YuHbfd/gYMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699584075; x=1700188875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAjsVPWd/ehZqbe3QFdWIqnf2rx9TzDSke7v1bpYiZc=;
        b=RUSg01Yyedl81DvsRtfjvLoqQxysDIncVW4l1g38Yhy19Mzz40Kg9IM4WCM+dSwbua
         nPGOqMyAJUMiZ+7gVjRo9J76rwhjY6AEvvdhlXT4/uSglueV+x0Q+t/LIRe3RDHUrfxF
         iKWItDqHlWNPXvYRkZspp4x0EfA15X7eRwFPh442EF4VjZot0rngAJRPacsk+JUWXeJ+
         EVRTG4TB+LDz3xk5PB3QvsfJ7FBBuJ3T47RefMVAftL7eEvOagoWZHbNofr+mc3Ou9IC
         gpOF6uD58yqey9tuNRMoEHKvOfdQq4qwgTX20alzm52uZPd7dsRntC9OKlQpQTc6TVC8
         g+9g==
X-Gm-Message-State: AOJu0YzzFG6xqtk0maJXeKkF3HqKCnK0q2FgvYkhyVnfFiAkPQGH92Uc
	hDMW3W/g4A5kODpvJoo+01ikKUgeQk7cs9mBxgY=
X-Google-Smtp-Source: AGHT+IHCJVVVOYQBwlmfuQGbrTexsgg3xMwpdQEYTbBBLH1/d12ZujR7ozwWyise15ZjiYaI8w0l4enhi/QGfpmo1NY=
X-Received: by 2002:a17:907:86a2:b0:9b9:4509:d575 with SMTP id
 qa34-20020a17090786a200b009b94509d575mr4299018ejc.2.1699584074747; Thu, 09
 Nov 2023 18:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20231108215050.11121-2-zev@bewilderbeest.net>
In-Reply-To: <20231108215050.11121-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Nov 2023 13:11:03 +1030
Message-ID: <CACPK8Xd2x7Ek_8uetZ-tsi_qfUGGYL8ktfN_iduqkTs3AVDVfA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5] net: ftgmac100: support getting MAC address
 from NVMEM
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Paul Fertser <fercerpav@gmail.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 9 Nov 2023 at 08:21, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> From: Paul Fertser <fercerpav@gmail.com>
>
> Make use of of_get_ethdev_address() to support reading MAC address not
> only from the usual DT nodes but also from an NVMEM provider (e.g. using
> a dedicated area in an FRU EEPROM).
>
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> Link: https://lore.kernel.org/r/20230713095743.30517-1-fercerpav@gmail.com
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> (cherry picked from commit 2cee73cef253a333c7d48a0f8edda53e3cca990c)

I didn't know the kernel had code to do this. Very neat.

Applied to dev-6.5.
