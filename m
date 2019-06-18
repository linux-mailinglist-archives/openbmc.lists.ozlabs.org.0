Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329194A38C
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 16:11:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sqky48FXzDqd2
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 00:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sqjf3SXRzDqVQ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 00:10:29 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id l128so8642696qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 07:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ymzVRv+HbWASk9IbK9IR5jfXe4p30txsWn7MI2aWfko=;
 b=Pz5Uh/ezH8X2/eu6aPm8+zyU5QgkqjhGuZa5uUeKhV6/KaCHUL0e+eikqs0CgwW23I
 zrE8sa9BlcApVp50dCjl6hvL82nab1ZqJT3hvTLJYB0dzf41278eFLueQZ56Yxr9BtVU
 hQCRBDGxd10oD7QZ7k4L72tJNHGmTLc9YzeUEYowM1DDqsWbnjtp9TBIAAFE+9eWVNtp
 t2mFc7VCDBTs0RjmrNXid43hbO9bZBAbMfTuCgVF1lxiIvo/HCp2thXUyPqz0WXtCEpw
 ag3OYYOHlTkOgLTYcEh1A8UahDbT0NrCBf2wq0jGgBmB4ymqTQnmFdPeskshm3e5MwzM
 GgWw==
X-Gm-Message-State: APjAAAUxblLjdRGrAHpFWUuYflAkNeLOVCge8CpHp+o3wWyhy9nz0ksu
 g5IDr6XzcqlsTN4ggtxvfQ==
X-Google-Smtp-Source: APXvYqzTd+SUScnI+raBK375orxhwOZtIjBl7LTQ+SrdOuzX+fB6KoQ7w06WVT6SBK2QaP+LwnqcBg==
X-Received: by 2002:a37:9ece:: with SMTP id h197mr75339469qke.50.1560867025673; 
 Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Received: from localhost ([64.188.179.192])
 by smtp.gmail.com with ESMTPSA id s11sm9602685qte.49.2019.06.18.07.10.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Date: Tue, 18 Jun 2019 08:10:23 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: Add missing newline at end of file
Message-ID: <20190618141023.GA20154@bogus>
References: <20190617143322.4332-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617143322.4332-1-geert+renesas@glider.be>
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
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jun 2019 16:33:22 +0200, Geert Uytterhoeven wrote:
> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
>  .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
>  Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
>  Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
