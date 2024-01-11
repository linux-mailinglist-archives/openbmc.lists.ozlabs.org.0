Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B731482B839
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 00:46:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N5BSTAOy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Xt1WwGz3cZ5
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 10:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N5BSTAOy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=giridharikrshna@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9Xc20syjz2yk3
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2024 16:02:56 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1d542701796so25986575ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 21:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704949372; x=1705554172; darn=lists.ozlabs.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=N5BSTAOyIcPsMq3crGS3yIKBKi+RcZzVnKZW4a8esIwsYPmKOlFK+744L1ZFuFzLKX
         tVxGM3LVpeudjr+ti5LhsW3cgVlHZNjDpBHBEacoJrLtSJGcFMYIQ0+kV7qFGlu6Y8aT
         hH9o+iO5ElVec1xsfZ+DDv/gBUtLQfOcu+IIG6qMyYQwuPaYftbiJJ//6/yW2ubeQs1d
         080gwct6yyOe3bOL+q566pxJYYd42yO5tWrVYtXbc/Ir1RO+rVH4phGBJFrierXIMxSJ
         YHQSrTS2LwWpSCFawFPT0Hui+bxJuwsiwD4VFfgd6+3afiLvB7KSeGr6n8IafPwtDNfm
         lXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704949372; x=1705554172;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=bhFf/xYzxMcubP2tNloAX+mKwLocV3eTpqOuHyQjVeOn+4aQEzYy3l9bWrFngYAY1y
         jIsuGI0OZMg3rKgoFJoGji7dFRXdBRJP+gFgFiQ4aXk3ljmvoUW8l7Cnjy3LaKNf7Hjh
         gpECmYLOJx95gD3f2GferZ7EfC+L3OrwhDk8rW3vRPHkUqIzYJ+7VLMbyqDO+5G9hnbw
         UQ1rHGLoZvStpJWWRYBrkaTFDDzHZXRIRIPNnYGPfWt6mMgu8NtQAdOlmXEYjMS4MYSY
         6rUsUe38Q89L6f2AhGZ2tmBAAObjySngTiQH/pRv0b6AFb9XXI/3dXSIojoOr7uAgvhz
         Wf8Q==
X-Gm-Message-State: AOJu0YyJvuboKuwwu8wy/rsHtLo8CjCeU+xAfEtuFseXn7S8xvJ4paSe
	f/Vy0LySTZyCxsuTrS/t7rz9rf49hTTD1YlXCaI=
X-Google-Smtp-Source: AGHT+IHXynnllt3dDn2GQJaeTmlqChsOwaoNFW7vNFhucjgauFLhDw1MRC1Ze1grlu5OpTm/H0uhMQ==
X-Received: by 2002:a17:902:8a86:b0:1d4:a24c:4be0 with SMTP id p6-20020a1709028a8600b001d4a24c4be0mr541168plo.133.1704949372386;
        Wed, 10 Jan 2024 21:02:52 -0800 (PST)
Received: from smtpclient.apple ([103.21.232.121])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902dad100b001d50ca466e5sm202684plx.133.2024.01.10.21.02.51
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 21:02:52 -0800 (PST)
From: G Krishna <giridharikrshna@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: arm: dts: Aspeed: Bonnell: Separate LEDs into include file
Message-Id: <52F6CCE4-2C34-4E1F-838E-CACFC0A4A6ED@gmail.com>
Date: Thu, 11 Jan 2024 10:32:36 +0530
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:42:46 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

