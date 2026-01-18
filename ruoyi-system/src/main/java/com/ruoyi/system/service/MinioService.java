package com.ruoyi.system.service;

import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.InputStream;

/**
 * Minio 文件存储服务
 */
@Service
public class MinioService
{
    @Autowired
    private MinioClient minioClient;

    @Value("${minio.bucketName}")
    private String bucketName;

    @Value("${minio.url}")
    private String endpoint;

    /**
     * 上传文件
     * 
     * @param file 文件
     * @return 文件访问地址
     */
    public String uploadFile(MultipartFile file) throws Exception
    {
        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        InputStream inputStream = file.getInputStream();
        minioClient.putObject(
                PutObjectArgs.builder()
                        .bucket(bucketName)
                        .object(fileName)
                        .stream(inputStream, file.getSize(), -1)
                        .contentType(file.getContentType())
                        .build());
        return endpoint + "/" + bucketName + "/" + fileName;
    }
}
