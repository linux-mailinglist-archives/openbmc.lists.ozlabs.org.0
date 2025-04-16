Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70CA90AAB
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 20:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd82j0P82z3cQP
	for <lists+openbmc@lfdr.de>; Thu, 17 Apr 2025 04:00:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744826442;
	cv=none; b=HALwELC5TDbowxkdtlqUJsrEewrvXu8gLNkaGH9GEX0yRVHiuR5ZZ8D7d1+EGs1IA88bRhHBsM4/r0NqxOBelnwpIci6bG4/1Qh2dLGvDqKo33USuNIWwfnNzpTXPyzdPpR5+uSc7hA0LZPcG0lDzxKyvR+nvvvCFi2K5iy2dGjKVbsrIizJi0pGu2KeHVquRIg6JbtBaIAhdFU4Z2JIktEJFpyfhbrLZHTdUx0B5s8C2/uw9+/zyinhTqXmjJr43ah30dgw6380aEHtpz9Srgsb9QoP0WGytTEzV5Y+OImUArNQ4WwZUvmA9KwhUZ+P/yfHF7sMMvxUzNEJdsU41w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744826442; c=relaxed/relaxed;
	bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRXB/QeoFXwtJhw/9Agwl4vvVTVyPQuNiYNj8KQaFVjbc7r0MaEwnkNny0ohzmrlAOu3cw1SKQd5l2q0+G+L2u9rKg0WI8U+U35vTfP1p5bvf/+dTADmclMkrY5eXXf12sELfS2MYDGzuENWPA4b8pm3CnwYFSTJMfbFKI7b5m9dWSnn9yPAae8NRUGACEN20btIJ4L2MoqPBP7GsrG9uIjqu6ohP4vCVPXXTWEUjTap890IDKzl9uUCnGknvLenJb0t9eqK4+VRhMfeE6vBWGriQ1LghICI7c1yPLlQThCVf/hhHNaQnCbQL1c3j0e53Wj/KkN/mpTgC75AvD+b1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JMgKj25v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JMgKj25v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd82c5Ygmz30YZ
	for <openbmc@lists.ozlabs.org>; Thu, 17 Apr 2025 04:00:40 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e6df32ad351so5664694276.2
        for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826438; x=1745431238; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
        b=JMgKj25v5Tz7gUFIilXYM22dYe2PPHcRAijZR8plS4hbOOVI6UO5/okLA/cc9Azeda
         f0NczaoMZ6fro5NcxU4c2l3pb5Y8tGYydR2w5wD/EpqgihNgoJPZ7VIDqfUjEq0I7u6F
         upYLiII16w7zM/DmoajcuBJheaJ6ocbXwXUI/I+YknwvBCkby9AGaoQLL+Q9UUhIzTd3
         g7TwUvLJw+eFqNHdSfaei+wLm7ixqinrSG6aw7w4NqEM8IE0FuVvry/OCraIetLsOQI1
         RQcBLOvlrWb0DdNJ163Nc4OUB75VVX3a92ypD3CgSfny8QRDSgB+M7npCMmuLJnmYwL4
         8Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826438; x=1745431238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
        b=KfPjKhq/fEelo0pV2/Ec4d3J4+aPeSLP0IJltaNVxas7DiC9chn2AF23idGAmkjcH7
         Wp7hiRJvsh0LgTX+Sbe01PnwPT9a0CMLukDsauMx1HZd1liZgtSwpqKulrC5nVYO6px2
         FxZrOD+hDUWLb7EC7ZGvtRmfeJ3aYaOn2gheAGXwYorz6SXs+lajcXWjZxbHEd7cLVm+
         Px1OoeTRQ/UcUD90PzGLaVtlCLagrda7vRFYH0p1+Zwn73Rj73IbcEsSkzRduzYauyjo
         G0IYHILoldwZUeFFztXB924HLAQtQEvILm0dDbOsC7fzJPKbgQ6alNSXF3vo70Pimjk3
         Hh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwLaNVUfRqUcwu0daiXY1BOGPkd34ZyNdC3lDkRjcjA9JZIff3qpYgX3zfBilZcX6Ho9Jk300q@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7CQBj8GNpFoQSQx7Pfl5vydB1fbdtLwh+/UuDa5wRqVaaidwQ
	2+paSwzCj/l7aP599Gvq3wFGlf8xwHR9Oei20rKC79IK+M85Q7jc+fCoBvh049aJNO3AED3sUfg
	K/r/f/BFzP5/uFGHrQiaSeGhmdwg=
X-Gm-Gg: ASbGncvZtgV6dzfqanLdQuMRGFykNPVkaELhQkNS/438AVKyTPy/rgTVcT4GrJ6fCI0
	Kz2k/CQtCBwkKfLkRqVs2kEu0gzsJU6REQ9VCBxScf6p3OY4LG8nFZTaMLDUJKtj6he29GlSR8d
	45HIgr8cnih0OFqgm/C+voC8M=
X-Google-Smtp-Source: AGHT+IGB8oCqqfaWsVNagbDEQkYgDTuZs8G2qd2r+3/NlNRtfFD2gJC9vJ1mnc/kLpHnmhHah4bCxtXr7QqVZ+WxeC4=
X-Received: by 2002:a05:6902:981:b0:e6d:fb0f:fcac with SMTP id
 3f1490d57ef6-e7275f25641mr4050749276.40.1744826437731; Wed, 16 Apr 2025
 11:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250401235630.3220150-1-william@wkennington.com> <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
In-Reply-To: <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:00:26 +0300
X-Gm-Features: ATxdqUEFakrB13IND0DAqq207TNLwCbMoXu2w24Hy0B0OvjA503gTpT4TrQ1xSk
Message-ID: <CAP6Zq1izXL669DcYeLOnCDYknRPfVi7J0Ad3BjQTp1h1tZuW0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>



On Thu, 3 Apr 2025 at 17:34, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Tue, 01 Apr 2025 16:56:30 -0700, William A. Kennington III wrote:
> > The driver support was already added but we are missing the nodes in our
> > common devicetree.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
