Return-Path: <openbmc+bounces-760-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FBBE89ED
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 14:42:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp4Gn5mlqz3cYG;
	Fri, 17 Oct 2025 23:42:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::936"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760704961;
	cv=none; b=bagOyDrUfHveqT/Aej5O9FrEBw70QwxiB5AnXST1tjAtp7F11iDTRi2sr7zFJWa9U1qOxMBdNMCrLUG0C52ZXlnTOF/Hgrs+8GXE8MRpF7vHAF+wBWafjRC18kugC1V2atRi7QaO+KmPtYXZje0q05MgY+3p4PdquxW0VX7AxZ8iTgPwA1pmcEnYQCh/PF/sxJxJS4n8ow8H3/BhDPaqn0pf450+wvujX+N8iJ4GGsODTg5oZO2sSlellXPnjXMV9QaqYdGS4pQD051Di2BRqpygEQvVST+6/Lb1RzIzUgDQNzyl3k4wvjKnmdBNr8YA/U/0t10Sd/DBR4HFr6M/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760704961; c=relaxed/relaxed;
	bh=gqCZhryuusnOdluHro6sq52rUy9P/OFJGLbRCrE/NUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQGIcT39WbftwgKCVXUngO0JyaJ4RzM89tqNPHkasfez08YFgYewxUSE0l5zC3k9TSyXWiTThv0qgT6pUH2ttHFVdfi2ZVvpup3C49sUNdgmwepuRtggGv0PoWCSmUNmfBtEfVWQ9OA6EqZvkhZa07LoG8kxCdwPWswfeGyH+OLIYvjw2fiIXhmSZk/eZCrckKZ9daAIENBa6qbBMLxU9xrrNwqYuCWUkm+OuDj3OjZuKE48rWVB1T7CIBhU9qYLtZ4c8dqkLlss2bZnDKmMnra0Hrpz7pm9sHp6wz9uP49B4SRRNka1tW6Llq8UEyovUw7xbveLpx6EWL7U69sWOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PREEioJL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PREEioJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp4Gm3PBlz2xQ6
	for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 23:42:39 +1100 (AEDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-8e3eaa30c71so1280074241.0
        for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760704956; x=1761309756; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqCZhryuusnOdluHro6sq52rUy9P/OFJGLbRCrE/NUo=;
        b=PREEioJLXncYyeohYJvZ1rRDMlb4PoVEEkaYyRIf9R/CyKpOornx8b0grNrLRS889G
         /a6u8tjVPQ1pva246Z39df8/BsHQ5P5fRfG58K0JbfzNHvOSvS+X6BJX+sBmpOUjKY2E
         ib0LTzLQhyFmtzKi3ylEbbQWj0pYGd5kvETUbYLPWXg0FXu0XgptMgMeo2/ZWH6R8wAI
         LV2Ns3eECCd7v8TYDlJeV9E/jvDqGFIwHrjd+jkLyqAVvKdAKXMVtH5xUk1MEA2zr1LP
         ODDqCrgg5HI7XdOwHc8WJ5hq8E1Y9EDp77d5Ailz0wDdkUNAtEE0RJbqzR12YXCF+jye
         lG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704956; x=1761309756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqCZhryuusnOdluHro6sq52rUy9P/OFJGLbRCrE/NUo=;
        b=ePBBBDyy5zdKmKua7rjuejUVL3v6//10V5RNjzGqfRXxStUZkUzIhqdLRGyTPHDKA/
         ot0ajqsZ5wwq5lfenaw83bNvZJA8ZRBRDsputiI+bgXx5or0Eb5YarjUOJaWt0bfcc7y
         s6vYKWdst1FcCtaPKBkY7xIjZ8FwiSxtCwbfiV2GJF6XHuddBle15i9In4vt9lzC7RLQ
         Xn3oY2eR+sOzMfCrcIbZejAekF7X4uHg7xdXheVBtz/PuxyPnLacZJ0Mi88jhZQBWt0e
         G0Q4DudfXXHeGgtw/VJz0OUTYlGLLlEmKejzNhcfYmKYhwZZQVimIfCTRXNH9uNufjuU
         2GHA==
X-Gm-Message-State: AOJu0Yx9Kb9ktZAe45wTCVGmjjCzxMVs7vtpjicfjtzqusaAp2lYb06j
	METrZ7i7N90PM7PuHomF4pdHEEIT2AGugC6wEgLb1mOQHmXAXCWB2n9QDekn9PbNWSHMbQEbovK
	ReQLjxIej0F/uJi9eGI64gozsV2MkwQI=
X-Gm-Gg: ASbGncvgRj6TjYDQDa4LEpgL2W67PnFzCsMVAzwItFYKOP3Zqr8NNl6+pRRZ/YMCzIH
	W2E6RN1sJzC+0zXXYZRSeG9cHMvyVxZRajv4ctf1NyzwKirt8zfpKMQ9J3+cJbN5t0XMTKlj6Bj
	4piFCHojQjIL7opzG1Rm6tXw9uZMx/85S0wBMHAW6Z4Z1XFf6E/Za8I7n6ZrgljzBBltKCiEVPz
	qiZ33XrZ3OqpOtfuDlBdMr9es9jsKTmM+kNG8+STNOde1kjpLmQ0W76AzfCyLZ8Py+855U=
X-Google-Smtp-Source: AGHT+IFF+mS6ehGKaBTtVcdxaZrbYOgcPuUz+UckFiOc/IMNzYsaSgflb88GZ5JE+35BiXsH9XXy41Dii3Su0vSGJlE=
X-Received: by 2002:a05:6102:1624:b0:5d5:f6ae:390a with SMTP id
 ada2fe7eead31-5d7dd6d5484mr1509564137.40.1760704955643; Fri, 17 Oct 2025
 05:42:35 -0700 (PDT)
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
References: <CH0PR14MB4820E890AC1893D7795260B2E6E8A@CH0PR14MB4820.namprd14.prod.outlook.com>
In-Reply-To: <CH0PR14MB4820E890AC1893D7795260B2E6E8A@CH0PR14MB4820.namprd14.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 17 Oct 2025 07:42:19 -0500
X-Gm-Features: AS18NWDowfIfFcAwjRUXBNRAImuRJsClL67524H1rX-RZuBReLxubnQBYaXU86k
Message-ID: <CALLMt=o5-VAqPh2jrUtYuV3FVsNfg8TZ+=0h8KPnu8KKowvy6A@mail.gmail.com>
Subject: Re: OpenBMC Lenovo CLA update 2025-10-15
To: Chris Wood <cwood2@lenovo.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 6:08=E2=80=AFPM Chris Wood <cwood2@lenovo.com> wrot=
e:
>
> Attached is an updated Lenovo CLA Schedule A update that picks up one mor=
e name than the currently executed CLA.

Thanks for keeping your CLA updated. The new document has been
uploaded to the projects google drive.

Andrew

