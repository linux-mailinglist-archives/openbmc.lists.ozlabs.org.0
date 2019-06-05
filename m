Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F503356EC
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 08:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jdwp4C6nzDqVr
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 16:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SIJv4af9"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jdrn3J5PzDqWn
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 16:18:17 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id w25so19315638ioc.8
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 23:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b1H3ypLohVSMeKCy4E9EE0iGw/dNq7Vu4M4euQmVzYE=;
 b=SIJv4af9aqWKjeGUjjpf1Qatrj47/fTybiQ83RdUojJqwLfenrIVGb9tmc/Tjppbnd
 1OGNL/YTQTp27+g3DrmDctMwuXAoV8Dva/aQLufSgoNzLcz2aH2D6+9PDQvfPL15Yfc6
 0+1KLpWPoLICIOaAxdgvxWmN5KFGSU27gZr5/2nDzzJbyf6p5hpDXZ4JnzOdjkobDzjc
 It5JxGj6wW6kHp5RPuAE8EDI1QJGO/6vHPineT2qsJ6Y6hSrdgWd0mhBVpsSaMTOWPLV
 sANES7/POs/mhYkOvI0BN7LF1fGlluqgG+q2E3IGg3ZM6GJrQB8ab1P0zUCEi0EyfEIv
 iVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b1H3ypLohVSMeKCy4E9EE0iGw/dNq7Vu4M4euQmVzYE=;
 b=mO0oWQqhn/ealvCYniUwc4GsJlPG0Yz/5SR5vSvfRvDm2v3MPkiqICkYTqVR/MWGIh
 L+atyHE8LifLWb2T0PKNniWEA55yUR/Dpg+MKPIqeSlQ0GJ3DAjQrdOShyNzKKlq0omy
 XS7/NbGzNaOU2OQc6fCMQcwwVIm1M1aTqk6v2K0Os0DM4BJzky9ZpmuiWOcQGT3JYqvc
 WHcTHV8+vyJT9N5x9xtnXSi5m/Ux8xIhHIXUcoBmdbbhvdbv+EywTdegR7TziOutkFiQ
 4wrNI4OSSZEP5Zxos7u2Gd2gGuK5wySvIc00uGlQjJnS33bK20MceQQ/ZgW2UsamDsev
 Z2YQ==
X-Gm-Message-State: APjAAAUaAIw04PJlThlB7jGVNaWNr4mkoKUwI3VQ+O04qgDFadyy3pjF
 SGjEdpBAU0tXw7tGPHOj9r2abXeqaYeI8acRCI1DofgiX/AVig==
X-Google-Smtp-Source: APXvYqxu1foPTxr07ZZQcO++5wjWYQK51wESQUDjqNGVjQ+G6V7P1DNH+ss+0ygc+3L/8+PXQcSBUE7mBb8KyTSG3gY=
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr2324125iok.52.1559715493770;
 Tue, 04 Jun 2019 23:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
In-Reply-To: <20190604182635.GD46814@mauery.jf.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 5 Jun 2019 14:18:02 +0800
Message-ID: <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> >The PSU firmware code update will re-use the current interfaces to upload,
> >verify, and activate the image.
>
> We would like the option to be able to ship the PSU firmware as part of
> the BMC image (in the root filesystem). This means that it is already
> present and authenticated when the BMC boots. In this way, we know that
> the current BMC firmware plays well with the PSU firmware and have fewer
> variables to test for when making a release.

Because the PSU firmware is part of BMC image, this seems a completely
different approach, and more like part of BMC image update, is it?
I would expect this should not be part of this design, what do you think?

>
> I suppose this could be done by skipping the download phase and simply
> creating an activation object at boot and then initiating the FW
> activation automatically.
