Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D2751BB2
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 10:35:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RQoPaZBY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1nxg33ygz3c47
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 18:35:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RQoPaZBY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1nx40N6zz304b
	for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 18:35:17 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so384409276.0
        for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689237314; x=1691829314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCVcViIcc8p6hkBOLFnmj5ymUcOmzk8XlVKV/+wLel8=;
        b=RQoPaZBYNYRPmBW3knmDIsyz1alJ5maAM6escugI9fmrSWJAHoqXcQHXtr+2/Nr/wE
         Vdgp6l9FgR7UVCU7OPijH+U9wSutYZUEuDR6iBoaPEqDxpCAbxHHFZxNVFWrNyu56ybA
         Tqwcr8IPY5YktMffzr1W80XTV8Ilvvyqh82cDO4jCtQVn/2nsoVnxJKza/AOUV2IZf8m
         pgcUsjLpEhHwX4iWRRbSD2FvebL/6PmiCGQPgvEdQ+bZgpBvecZEdqY0OSBEmzmFSwn2
         KL3UJ5VuVg5wqfVp7AfsLMZH0n/2MB2er/L40hYbcHeGsVBrtVOKgq+EfXhNB/jqeyq/
         X0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237314; x=1691829314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCVcViIcc8p6hkBOLFnmj5ymUcOmzk8XlVKV/+wLel8=;
        b=Uv2TpG9exTh341BAZIemEd20HZpzmixOeMRc4qtEk/UTa3AgWq+qhuu/7kYwxkjRaP
         vPPDGHa/x3A+vg2sDqHSy0UEEpQR4upnLqPGNOBNXrCQSWfBP7NzQBMNEhakTWz0oxqE
         /mQYEVQuLStv8XkG7UTJUW9LYRLBSOn7mfMC5ZHozTKeqq8QGlLTrVEo8t1l3nxLlbYs
         ebsleO6Sz7I6VpGKI9P3u/Ix74F5r12/OCOW+1ipb7Y+rHBhoUTgB/G7zfWx9MSgV+Ry
         C0l/k9Q1Z16bDT/bbKBK0lplpm4PbKAbjXtikib7BFhOOim5f8Z0fqX725nph6yKfJoy
         EjFg==
X-Gm-Message-State: ABy/qLY0czSBoVYGakOO/m6Cozr4rtrD91OeJfgjz8sI+zuZKXTe8t0P
	BrFA1DqeTQik64QKHM/OpYYRlrdW+CBaigvi8Cw=
X-Google-Smtp-Source: APBJJlFdxYBrx8/JMXZJNKP2+4vL7+oJgdvKhVZ7pnlZrhth7w03avZqG9ug/WAYXIly7dAB8d8KbiYKieGiZVfIs+s=
X-Received: by 2002:a25:d1c1:0:b0:c1a:b0e2:e930 with SMTP id
 i184-20020a25d1c1000000b00c1ab0e2e930mr961170ybg.3.1689237314314; Thu, 13 Jul
 2023 01:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <d47818d4-4167-4508-bec0-db6eee93edb0@app.fastmail.com>
In-Reply-To: <d47818d4-4167-4508-bec0-db6eee93edb0@app.fastmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Thu, 13 Jul 2023 14:05:03 +0530
Message-ID: <CAMhqiMpTV=ZAg3NcwgdfVRMT_A5-Bb=Eh1o+a5fy7+mzL-7SEA@mail.gmail.com>
Subject: Re: openbmc/ipmi-fru-parser: Second notification of unresponsiveness
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

My role in ipmi-fru-parser is as a reviewer and I have not been
reviewing the parser code since a long, I will request Vernon to
review this.
I will create an gerrit commit to remove my name as a reviewer from
the ipmi-fru-parser repo.

Ratan
